class CreateQuestionsStudySessions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions_study_sessions do |t|
      t.references :question, foreign_key: true, null: false
      t.references :study_session, foreign_key: true, null: false
      t.string :status, null: false, default: 'not answered'

      t.timestamps
    end
  end
end
