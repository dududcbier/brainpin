class CreateTeachersTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers_titles do |t|
      t.references :teacher, foreign_key: true, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
