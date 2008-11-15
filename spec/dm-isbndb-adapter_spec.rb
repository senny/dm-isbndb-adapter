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
    uri = @adapter.send :build_request_uri, {}, Book
    uri.should include('http://test.ch/api/')
  end

  it "should generate a valid isbndb-url when asked to do so" do
    uri = @adapter.send :build_request_uri, {:title => 'foo'}, Book
    uri.should include("&index1=title&value1=foo")
  end

  it "should convert the model-name to a valid isbndb resource-name" do
    uri = @adapter.send :build_request_uri, {}, Book
    uri.should include('/books.xml')
  end

  it "should url-escape the passed query-conditions" do
    pending 
  end
  
end
