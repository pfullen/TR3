class AddSiteManagerToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :site_manager, :string
  end
end
