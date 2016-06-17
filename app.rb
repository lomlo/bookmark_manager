ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base


  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/links' do
    @name = flash[:user_name]
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/links')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login_check' do
    redirect '/links' if User.validate(params[:email], params[:password])
    redirect '/login'
  end

  get '/sign_out' do
    erb :'users/sign_out'
  end

  post '/sign_out' do
    if session[:user_id]
      user = User.first(id: session[:user_id])
      flash[:user_name] = user.email
      session[:user_id] = nil
      redirect '/links'
    end
    redirect '/sign_out'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
