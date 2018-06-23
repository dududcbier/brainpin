class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :learnable, foreign_key: true, null: false

      t.timestamps
    end
  end
end
