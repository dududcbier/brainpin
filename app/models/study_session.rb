class StudySession < ApplicationRecord
  belongs_to :student
  belongs_to :subtopic
end
