$LOAD_PATH << File.expand_path( File.dirname(__FILE__) )

require 'adapter'

class DataFile
	include Adapter
	configure_adapter :sheet
	configure_adapter :document
	sheet :bird_sheet
	document :bird_doc
end

class XPoint < DataFile; end

puts "instance methods: " +(XPoint.new.public_methods - Object.new.public_methods).to_s
puts "class methods: " + (XPoint.methods - Object.methods).to_s