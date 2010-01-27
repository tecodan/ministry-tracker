class WebLink < ActiveRecord::Base
	serialize :permissions
	belongs_to :ministry
	has_many :web_link_clicks, :dependent => :destroy 
	
	def permissions=(str)
		self[:permissions] = str.collect{|i| i.to_i}
    end
    
end
