class CreateRosterLists < ActiveRecord::Migration[5.0]
  def change
    create_table :roster_lists do |t|
      t.references :roster, foreign_key: true
      t.references :employee, foreign_key: true
      t.string :perdiem
      t.string :expense_code
      t.integer :shift_id

      t.timestamps
    end
  end
end
