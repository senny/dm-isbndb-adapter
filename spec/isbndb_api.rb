module Net
  class HTTP
    class << self
      attr_accessor :response_type
    end

    def self.get_response(url)
    begin
      @response_type = url.to_s.match(/api\/(.*?)\.xml/)[0]
    rescue
      @response_type = :books
    end  
    response_path = case @response_type
        when :subjects: 'isbndb_subjects_details.response'
        when :authors:  'isbndb_authors_details.response'
        else 'isbndb_books_details.response'
      end
      f = File.new File.dirname(__FILE__)+'/fixtures/'+response_path
      Struct.new(:body).new(f.read) 
    end
  end
end
