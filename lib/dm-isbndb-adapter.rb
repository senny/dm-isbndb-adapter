begin 
  require 'minigems'
rescue LoadError 
  require 'rubygems'
end
require 'dm-core'

module DataMapper
  module Adapters
    class IsbndbAdapter < AbstractAdapter
      
      attr_reader :access_key
      
      def initialize(name, uri_or_options)
        
      end

      def read_many(query)
        
      end

      def read_one(query)
        
      end
      
    end 
  end 
end 
