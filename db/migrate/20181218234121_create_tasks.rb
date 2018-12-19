class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :content
      t.text :lead_notes
      t.boolean :completed, default: false
      t.integer :project_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
