class DropColumnIdCoordinatorFromTeachers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :teachers, :coordinator_id
  end
end
