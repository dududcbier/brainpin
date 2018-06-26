class DropColumnIdCoordinators < ActiveRecord::Migration[5.2]
  def change
  	remove_column :learnables, :coordinator_id
  end
end
