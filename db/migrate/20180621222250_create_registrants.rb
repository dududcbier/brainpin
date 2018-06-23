class CreateRegistrants < ActiveRecord::Migration[5.2]
  def change
    create_table :registrants do |t|
      t.references :user, foreign_key: true, null: false, unique: true

      t.timestamps
    end
  end
end
