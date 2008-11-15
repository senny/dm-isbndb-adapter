module DataMapper
  module Resource
    module Isbndb
      module AuthorModel
        
        def self.included(base)
          base.send :property, :id, String, :key => true, :field => 'person_id'
          base.send :property, :name, String
        end

      end # AuthorModel
    end # Isbndb
  end # Resource
end # DataMapper
