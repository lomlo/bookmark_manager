class Link
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :url, String
  property :tag, String
end
