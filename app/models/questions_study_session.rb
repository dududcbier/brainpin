class QuestionsStudySession < ApplicationRecord
  belongs_to :question
  belongs_to :study_session
end
