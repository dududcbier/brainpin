class CreateMaterialsRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :materials_ratings do |t|
      t.references :student, foreign_key: true, null: false
      t.references :material, foreign_key: true, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
