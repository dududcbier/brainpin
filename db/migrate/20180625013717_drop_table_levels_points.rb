class DropTableLevelsPoints < ActiveRecord::Migration[5.2]
  def change
  	drop_table :levels_points, force: :cascade
  end
end
