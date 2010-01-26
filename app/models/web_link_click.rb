class WebLinkClick < ActiveRecord::Base
	belongs_to :web_link
	
    def self.record_visit(web_link_id, person_id)
        web_link_click = WebLinkClick.first(:conditions => {:web_link_id => web_link_id, :person_id => person_id})
        if web_link_click.nil?
            web_link_click = WebLinkClick.new({:web_link_id => web_link_id, :person_id => person_id})
            web_link_click.save
        else
            web_link_click.update_attributes({:updated_at => Time.now})
        end
    end
end

