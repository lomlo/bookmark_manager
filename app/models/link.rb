require 'data_mapper'
require 'dm-postgres-adapter'



class Link

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :url, String

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_developent")
DataMapper.finalize
DataMapper.auto_upgrade!
