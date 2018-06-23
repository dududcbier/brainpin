class CreateSubtopics < ActiveRecord::Migration[5.2]
  def change
    create_table :subtopics do |t|
      t.references :topic, foreign_key: true, null: false
      t.references :learnable, foreign_key: true, null: false

      t.timestamps
    end
  end
end
