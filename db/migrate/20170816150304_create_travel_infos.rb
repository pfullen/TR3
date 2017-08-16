class CreateTravelInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_infos do |t|
      t.references :project, foreign_key: true
      t.string :hotel_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone

      t.timestamps
    end
  end
end
