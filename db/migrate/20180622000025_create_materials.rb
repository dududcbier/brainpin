class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.references :teacher, foreign_key: true, null: false
      t.references :subtopic, foreign_key: true, null: false
      t.string :description, null: false
      t.string :url
      t.binary :file
      t.decimal :rating

      t.timestamps
    end
  end
end
