class CreateStates < ActiveRecord::Migration[5.0]
  def change
    create_table :states do |t|
      t.string :state_name
      t.string :state_code
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
