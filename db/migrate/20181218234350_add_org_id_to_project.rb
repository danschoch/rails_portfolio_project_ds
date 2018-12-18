class AddOrgIdToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :organization_id, :integer
  end
end
