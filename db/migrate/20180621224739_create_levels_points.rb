class CreateLevelsPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :levels_points do |t|
      t.integer :level, null: false
      t.references :learnable, foreign_key: true, null: false
      t.integer :points, null: false

      t.timestamps
    end
  end
end
