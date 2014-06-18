$LOAD_PATH << File.expand_path( File.dirname(__FILE__) + '/adapters' )

module Adapter
    module InstanceMethods
	  
	  def bar
		 puts "instance method"
	  end

    end

  	module ClassMethods

  		def foo
      		puts 'class method'
    	end

    	def configure_adapter(type,classname="DataFile")
    		base = const_get classname
			  load_adapter(base,type)
		end

		def load_adapter(base,type)
			# load module based on type
			case type
				when :sheet
          require 'sheet'
					mod = External::Sheet
				when :document
          require 'document'
					mod = External::Document
			end
  			base.send :include, mod	
  		end

  	end 	

  	def self.included(base)
    	base.extend(ClassMethods)
    	base.send :include, InstanceMethods   	
  	end

end