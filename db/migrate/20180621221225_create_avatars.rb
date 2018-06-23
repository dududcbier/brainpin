class CreateAvatars < ActiveRecord::Migration[5.2]
  def change
    create_table :avatars do |t|
      t.string :avatar_name, null: false, unique: true
      t.binary :img, null: false

      t.timestamps
    end
  end
end
