class CreateRosters < ActiveRecord::Migration[5.0]
  def change
    create_table :rosters do |t|
      t.date :week
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
