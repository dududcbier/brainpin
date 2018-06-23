class CreateLearnables < ActiveRecord::Migration[5.2]
  def change
    create_table :learnables do |t|
      t.references :coordinator, foreign_key: true, null: false
      t.string :name, null: false
      t.integer :max_level, null: false, default: 10

      t.timestamps
    end
  end
end
