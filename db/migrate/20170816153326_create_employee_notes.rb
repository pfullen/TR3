class CreateEmployeeNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_notes do |t|
      t.text :note
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
