class CreateAvatarRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :avatar_requirements do |t|
      t.references :avatar, foreign_key: true, null: false
      t.references :learnable, foreign_key: true, null: false
      t.integer :min_level, null: false

      t.timestamps
    end
  end
end
