class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.references :course, foreign_key: true, null: false
      t.references :learnable, foreign_key: true, null: false

      t.timestamps
    end
  end
end
