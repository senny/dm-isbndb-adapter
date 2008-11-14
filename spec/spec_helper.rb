require File.dirname(__FILE__) +'/../lib/dm-isbndb-adapter'

$MOCK_ISBNDB ||= true

require File.dirname(__FILE__)+'/isbndb_api'

DataMapper.setup(:default, {
  :adapter => 'isbndb',
  :access_key => 'PJ6X926W'
})

class Book
  include DataMapper::Resource
  include DataMapper::Resource::Isbndb::BookModel
end
