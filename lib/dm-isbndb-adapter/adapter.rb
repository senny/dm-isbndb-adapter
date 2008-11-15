require "cgi"
require 'dm-core'
require 'net/http'
require 'rexml/document'

module IsbndbInterface
  class SettingsError   < StandardError; end
  class ConditionsError < StandardError; end
end

module DataMapper
  module Adapters
    class IsbndbAdapter < AbstractAdapter
      
      attr_reader :token, :api_url
      
      def initialize(name, uri_or_options)
        super(name,uri_or_options)
        @token = uri_or_options[:access_key]
        @api_url = uri_or_options.key?(:url) ? uri_or_options[:url] : 'http://isbndb.com/api/'
        @api_url += '/' if (@api_url =~ /\/$/).nil?
        raise IsbndbInterface::SettingsError, "You must set a access_key" if @token.nil?
      end

      def read_many(query)
        Collection.new(query) do |set|
          read(query, set, false)
        end
      end

      def read_one(query)
        read(query, query.model, true)
      end

      def create(resources)
        raise NotImplementedError
      end

      def update(attributes, query)
        raise NotImplementedError
      end

      def delete(query)
        raise NotImplementedError
      end 

      private

      def read(query, set, one, page_number = 1)
        raise IsbndbInterface::ConditionsError, "You need to specify at least one condition" if query.conditions.nil? || query.conditions.empty?
        model_name = query.model.to_s
        properties = query.fields
        options = extract_options(query)
        resource_url = build_request_uri(options,query.model,page_number)
        doc = request_isbndb_xml(resource_url)
        doc.elements.each("/ISBNdb/#{model_name}List") do |list|
          total = list.attributes['total_results'].to_i
          page_size = list.attributes['page_size'].to_i
          current_page = list.attributes['page_number'].to_i
          list.elements.each do |record|
            attributes = parse_node_childs(query,record)
            values = result_values(attributes,properties,query.repository.name)
            one ? (return set.load(values,query)) : set.load(values) 
          end
          read(query,set,false,current_page + 1) if page_size * current_page < total
        end
      end
      
      def request_isbndb_xml(url)
        xml_data = Net::HTTP.get_response(URI.parse(url)).body
        REXML::Document.new(xml_data)
      end
      
      def parse_node_childs(query, node)
        attributes = read_node_attributes(node)
        node.elements.each do |child|
          attributes.merge! read_node_attributes(child)
          if child.node_type == :element
            attribute = query.model.properties(query.repository.name).find do |property|
              property.name.to_s == Extlib::Inflection.underscore(child.name.to_s)
            end
          end
          
          if attribute
            attributes[attribute.name.to_s] = child.text.strip unless child.text.nil?
          end
        end
        attributes
      end
      
      def read_node_attributes(record)
        attributes = {}
        record.attributes.each do |name,value| 
          attributes[name] = value
        end
        attributes
      end
      
      def result_values(result, properties, repository_name)
          properties.map { |p| key = p.field(repository_name); result.key?(key) ? result[key] : nil }
      end

      def build_request_uri(options, model,page_number)
        resource_name = convert_model_to_resource_name(model)
        resource_url = "#{@api_url}#{resource_name}.xml?access_key=#{@token}&results=details"
        options.each_with_index do |condition,index| 
          prop,val = condition
          resource_url += "&index#{index+1}=#{prop}&value#{index+1}=#{val}&page_number=#{page_number}"
        end
        
        resource_url
      end
      
      def convert_model_to_resource_name(model)
        model.to_s.downcase.pluralize
      end

      def extract_options(query)
          options = {}
 
          query.conditions.each do |condition|
            operator, property, value = condition
            case operator
              when :eql, :like then options.merge!(property.field(query.repository.name) => CGI::escape(value))
            end
            
          end
          options
        end

    end 
  end 
end 
