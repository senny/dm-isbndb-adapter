module DataMapper
  module Resource
    module Isbndb
      module BookModel
        
        def self.included(base)
          base.send :property, :id, String, :key => true, :field => 'book_id'
          base.send :property, :title, String
          base.send :property, :title_long, String
          base.send :property, :isbn, String
          base.send :property, :author, String, :field => 'authors_text'    
        end

      end # Isbndb 
    end # BookModel
  end # Resource
end # DataMapper
