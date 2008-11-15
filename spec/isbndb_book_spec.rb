require File.dirname(__FILE__) + '/spec_helper'
describe "dm-isbndb-adapter" do

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