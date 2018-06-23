class CreateStudentLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :student_levels do |t|
      t.references :learnable, foreign_key: true, null: false
      t.references :student, foreign_key: true, null: false
      t.integer :level, null: false, default: 1
      t.integer :points, null: false, default: 0

      t.timestamps
    end
  end
end
