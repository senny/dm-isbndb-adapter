begin 
  require 'minigems'
rescue LoadError 
  require 'rubygems'
end

require 'dm-core'

module IsbndbInterface
  class SettingsError   < StandardError; end
  class ConditionsError < StandardError; end
end

module DataMapper
  module Adapters
    class IsbndbAdapter < AbstractAdapter
      
      attr_reader :token
      
      def initialize(name, uri_or_options)
        super(name,uri_or_options)
        @token = uri_or_options[:access_key]
        raise IsbndbInterface::SettingsError, "You must set a access_key" if @token.nil?
      end

      def read_many(query)
        #TODO: implement method
      end

      def read_one(query)
        #TODO: implement method
      end
      
    end 
  end 
end 
