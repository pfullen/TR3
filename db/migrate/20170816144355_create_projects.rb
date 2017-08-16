class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :company
      t.string :project_type
      t.string :client
      t.string :store_num
      t.string :address
      t.string :city
      t.string :state
      t.string :invoice_to
      t.string :project_manager
      t.string :status
      t.string :billing
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.integer :num_of_employees
      t.integer :num_of_shifts

      t.timestamps
    end
  end
end
