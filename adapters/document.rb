module External
	module Document
		module ClassMethods
			def document(name)
				puts "document " + name.to_s
			end
		end

		module InstanceMethods
			def words; end
		end

		def self.included(base)
    		base.extend(ClassMethods)
    		base.send :include, InstanceMethods
  		end
	end

end