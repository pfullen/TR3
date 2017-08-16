class CreateProjectTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :project_types do |t|
      t.string :project_type
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
