class CreateSubtopicsQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :subtopics_questions do |t|
      t.references :question, foreign_key: true, null: false
      t.references :subtopic, foreign_key: true, null: false

      t.timestamps
    end
  end
end
