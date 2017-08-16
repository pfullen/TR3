class CreateShiftInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :shift_infos do |t|
      t.integer :shift_id
      t.string :shift_days
      t.time :shift_start_time
      t.time :shift_end_time
      t.text :notes
      t.references :roster, foreign_key: true

      t.timestamps
    end
  end
end
