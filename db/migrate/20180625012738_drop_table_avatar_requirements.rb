class DropTableAvatarRequirements < ActiveRecord::Migration[5.2]
  def change  	
  	drop_table :avatar_requirements, force: :cascade
  end
end
