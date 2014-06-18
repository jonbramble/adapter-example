module External
	module Sheet
		module ClassMethods
			def sheet(name)
				puts "sheet " + name.to_s
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