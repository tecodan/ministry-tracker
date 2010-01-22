class CreateWebLinks < ActiveRecord::Migration
  def self.up
    create_table :web_links do |t|
      t.string :name
      t.string :url
      t.string :description
      t.string :permissions
      t.integer :ministry_id

      t.timestamps
    end
    Permission.create(:description => 'Create new web resources', :controller => 'web_links', :action => 'new')
    Permission.create(:description => 'Modify and remove web resources', :controller => 'web_links', :action => 'edit')
  end

  def self.down
    drop_table :web_links
    permissions = Permission.all(:conditions => ["controller = ?", "web_links"])
    permissions.each do |permission|
    	MinistryRolePermission.delete_all(["permission_id = ?", permission.id])
    	permission.destroy
    end
  end
end
