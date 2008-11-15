require File.dirname(__FILE__) + '/spec_helper'

describe "dm-isbndb-adapter" do
  
  before(:all) do
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
    uri.should include('books.xml')
  end

  it "should url-escape the passed query-conditions" do
    pending 
  end

  describe "getting all books" do
    
    before(:all) do
      @books = Book.all
    end
    
    it "should get a set of books" do
      @books.should be_kind_of(DataMapper::Collection) 
    end
    
  end
  
  describe "getting one book" do
    
    before(:all) do
      @book = Book.first
    end
    
    it "should initialize the id attribute" do
      @book.id.should == 'law_and_disorder'
    end
    
    it "should only read one book" do
      @book.should be_kind_of(Book) 
    end
    
    it "should initialize the title attribute" do
      @book.title.should == 'Law and disorder'
    end
    
    it "should set a title_long attribute" do
      @book.title_long.should == 'Law and disorder: law enforcement in television network news'
    end
    
    it "should initialize the isbn attribute" do
      @book.isbn.should == '0210406240'
    end

  end
  
  
end
