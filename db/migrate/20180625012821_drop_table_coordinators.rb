class DropTableCoordinators < ActiveRecord::Migration[5.2]
  def change
  	drop_table :coordinators, force: :cascade
  end
end
