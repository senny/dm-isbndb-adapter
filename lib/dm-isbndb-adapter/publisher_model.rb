module DataMapper
  module Resource
    module Isbndb
      module PublisherModel
        
        def self.included(base)
          base.send :property, :id, String, :key => true, :field => 'publisher_id'
          base.send :property, :name, String
          base.send :property, :location, String
        end

      end # PublisherModel
    end # Isbndb
  end # Resource
end # DataMapper
