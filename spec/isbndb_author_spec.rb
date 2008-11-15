require File.dirname(__FILE__) + '/spec_helper'

describe 'db-isbndb-adapter' do
  describe 'when all authors loaded' do
    
    before(:all) do
      @authors = Author.all
    end
    
    it "should load a collection of authors" do
      @authors.should be_kind_of(DataMapper::Collection)
    end
    
    it "should have a loaded author in the collection" do
      @authors.first.should be_kind_of(Author)
    end
    
  end
  
  describe 'when a single author is loaded' do
    
    before(:all) do
      @author = Author.first
    end
    
    it "should load only one author" do
      @author.should be_kind_of(Author)
    end
    
    it "should set an id attribute" do
      @author.id.should == 'anthony_a_atkinson'
    end
    
    it "should set a count of writen books" do
      @author.books_written.should == 1
    end
    
  end
end