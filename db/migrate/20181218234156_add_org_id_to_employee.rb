class AddOrgIdToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :organization_id, :integer
  end
end
