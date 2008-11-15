module DataMapper
  module Resource
    module Isbndb
      module AuthorModel
        
        def self.included(base)
          base.send :property, :id, String, :key => true, :field => 'person_id'
          base.send :property, :name, String
          base.send :property, :books_written, Integer, :field => 'has_books'
        end

      end # AuthorModel
    end # Isbndb
  end # Resource
end # DataMapper
