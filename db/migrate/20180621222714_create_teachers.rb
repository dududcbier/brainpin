class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :office, null: false
      t.references :coordinator, foreign_key: true, null: false
      t.references :registrant, foreign_key: true, null: false, unique: true

      t.timestamps
    end
  end
end
