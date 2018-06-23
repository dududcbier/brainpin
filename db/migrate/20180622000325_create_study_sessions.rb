class CreateStudySessions < ActiveRecord::Migration[5.2]
  def change
    create_table :study_sessions do |t|
      t.date :start_date, null: false
      t.references :student, foreign_key: true, null: false
      t.references :subtopic, foreign_key: true, null: false
      t.date :end_date
      t.integer :num_correct
      t.integer :num_questions

      t.timestamps
    end
  end
end
