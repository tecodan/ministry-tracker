class CreateWebLinkClicks < ActiveRecord::Migration
  def self.up
    create_table :web_link_clicks do |t|
      t.column :person_id, :integer
      t.column :web_link_id, :integer
      t.column :updated_at, :timestamp
    end
  end

  def self.down
    drop_table :web_link_clicks
  end
end
