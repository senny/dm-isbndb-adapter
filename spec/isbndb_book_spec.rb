require File.dirname(__FILE__) + '/spec_helper'
describe "dm-isbndb-adapter" do

  describe "getting all books" do
  
    before(:all) do
      @books = Book.all(:title.like => 'Rails development')
    end
  
    it "should get a set of books" do
      @books.should be_kind_of(DataMapper::Collection) 
    end
    
    it "should only contain books" do
      @books.each do |b|
        b.should be_kind_of(Book)
      end
    end
  
  end

  describe "getting one book" do
  
    before(:all) do
      @book = Book.first(:id.eql => 'the_rails_way')
    end
  
    it "should initialize the id attribute" do
      @book.id.should == 'the_rails_way'
    end
  
    it "should only read one book" do
      @book.should be_kind_of(Book) 
    end
  
    it "should initialize the title attribute" do
      @book.title.should == 'The Rails Way'
    end
  
    it "should set a title_long attribute" do
      @book.title_long.should == 'The Rails Way (Addison-Wesley Professional Ruby Series)'
    end
  
    it "should initialize the isbn attribute" do
      @book.isbn.should == '0321445619'
    end
    
    it "should set an author property" do
      @book.author.should == 'Obie Fernandez,'
    end

  end

end