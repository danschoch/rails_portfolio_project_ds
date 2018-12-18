class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :due_date
      t.integer :lead_id
      t.text :description

      t.timestamps
    end
  end
end
