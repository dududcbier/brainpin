class CreateCoursesTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_teachers do |t|
      t.references :course, foreign_key: true, null: false
      t.references :teacher, foreign_key: true, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false

      t.timestamps
    end
  end
end
