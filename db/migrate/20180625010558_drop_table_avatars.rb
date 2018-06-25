class DropTableAvatars < ActiveRecord::Migration[5.2]
  def change
  	drop_table :avatars, force: :cascade
  end
end
