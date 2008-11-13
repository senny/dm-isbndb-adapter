require File.dirname(__FILE__) + '/spec_helper'

describe "dm-isbndb-adapter" do
  
  before(:all) do
    @adapter = DataMapper::Repository.adapters[:default]
  end
  
  it "should raise an error if the access_key isn't passed" do
    lambda{ DataMapper.setup(:default, {:adapter  => 'isbndb'}) }.should raise_error(IsbndbInterface::SettingsError)
  end

  describe "getting all books" do
    
    before(:all) do
      @books = Book.all
    end
    
    it "should get a set of books" do
      
    end
    
  end
  
  describe "getting one book" do
    
    before(:all) do
      @book = Book.first
    end
    
  end
  
  
end