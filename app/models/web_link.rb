class WebLink < ActiveRecord::Base
	serialize :permissions
	belongs_to :ministry
	
	def permissions=(str)
		self[:permissions] = str.collect{|i| i.to_i}
    end
    
end
