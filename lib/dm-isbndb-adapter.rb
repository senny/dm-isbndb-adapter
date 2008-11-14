begin 
  require 'minigems'
rescue LoadError 
  require 'rubygems'
end

require 'extlib'

Dir[File.join(File.dirname(__FILE__), 'dm-isbndb-adapter/*.rb')].sort.each { |lib| require lib }
