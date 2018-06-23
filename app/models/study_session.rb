class StudySession < ApplicationRecord
  belongs_to :student, dependent: :destroy
  belongs_to :subtopic
end
