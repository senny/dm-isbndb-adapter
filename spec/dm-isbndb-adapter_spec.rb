require File.dirname(__FILE__) + '/spec_helper'

describe "dm-isbndb-adapter" do
  
  before(:each) do
    DataMapper.setup(:default, {
      :adapter => 'isbndb',
      :access_key => 'PJ6X926W'
    })
    @adapter = DataMapper::Repository.adapters[:default]
  end
  
  it "should raise an error if the access_key isn't passed" do
    lambda{ DataMapper.setup(:default, {:adapter  => 'isbndb'}) }.should raise_error(IsbndbInterface::SettingsError)
  end

  it "should accept a url parameter to specify the api location" do
    lambda{ @adapter = DataMapper.setup(:default, {:adapter => 'isbndb',:access_key => 'asHd7JN',:url => 'http://test.ch/api'})}.should_not raise_error(IsbndbInterface::SettingsError)
    uri = @adapter.send :build_request_uri, {}, 'books', 1
    uri.should include('http://test.ch/api/')
  end

  it "should generate a valid isbndb-url when asked to do so" do
    uri = @adapter.send :build_request_uri, {:title => 'foo'}, 'books', 1
    uri.should include("&index1=title&value1=foo")
  end

  it "should convert the model-name to a valid isbndb resource-name" do
    uri = @adapter.send :build_request_uri, {}, 'books', 1
    uri.should include('/books.xml')
  end
  
  it "should accept eql and like conditions" do
    lambda { Book.first(:title.eql => 'The Rails Way') }.should_not raise_error(IsbndbInterface::ConditionsError)
  end
  
  it "should not accept conditions other than eql and like" do
    lambda { Book.first(:title.lte => 'Way') }.should raise_error(IsbndbInterface::ConditionsError)
  end
  
  it "should not be able to create a new record" do
    lambda { Book.create(:id => 'foo', :title => 'bar') }.should raise_error(NotImplementedError)
  end
  
  it "should take care, when the storage name is not identical with the model name" do
    book = BookD.first(:title.eql => 'The Rails Way')
    puts book.title
    book.should be_kind_of(BookD)
  end
  
end
