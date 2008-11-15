require File.dirname(__FILE__) + '/spec_helper'

describe 'db-isbndb-adapter' do
  describe 'when all publishers loaded' do
    
    before(:all) do
      @publishers = Publisher.all
    end
    
    it "should load a collection of publishers" do
      @publishers.should be_kind_of(DataMapper::Collection)
    end
    
    it "should have a loaded publisher in the collection" do
      @publishers.first.should be_kind_of(Publisher)
    end
    
  end
  
  describe 'when a single publisher is loaded' do
    
    before(:all) do
      @publisher = Publisher.first
    end
    
    it "should load only one publisher" do
      @publisher.should be_kind_of(Publisher)
    end
    
    it "should set an id attribute" do
      @publisher.id.should == 'oreilly'
    end
    
    it "should have a name atribute set" do
      @publisher.name.should == "O'Reilly"
    end
    
    it "should set a location attribute" do
      @publisher.location.should == 'Sebastopol, CA'
    end
    
  end
end