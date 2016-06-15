ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/data_mapper_setup.rb'


class Bookmark < Sinatra::Base
  get '/' do
    @links = Link.all
    erb(:'links/index')
  end

  get '/add_link' do
    erb :'links/add_link'
  end

  post '/' do
    link = Link.create(url: params[:url], name: params[:name])
    p params[:tag].split
    params[:tag].split.each do |tag|
    link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
