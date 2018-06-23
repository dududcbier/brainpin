class QuestionsStudySession < ApplicationRecord
  belongs_to :question, dependent: :destroy
  belongs_to :study_session, dependent: :destroy
end
