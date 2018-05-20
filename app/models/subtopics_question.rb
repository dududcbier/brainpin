class SubtopicsQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :subtopic
end
