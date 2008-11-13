require File.dirname(__FILE__) +'/../lib/dm-isbndb-adapter'
 
DataMapper.setup(:default, {
  :adapter => 'isbndb',
  :access_key => 'PJ6X926W'
})
 
class Book
  include DataMapper::Resource
  
  property :id, String
  property :title, String
  property :long_title, String
  property :summary, Text
  property :notes, Text
  property :awards, Text
  property :urls, Text
  
end