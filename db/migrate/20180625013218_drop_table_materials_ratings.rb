class DropTableMaterialsRatings < ActiveRecord::Migration[5.2]
  def change
  	drop_table :materials_ratings, force: :cascade
  end
end
