class CoursesTeacher < ApplicationRecord
  belongs_to :course, dependent: :destroy
  belongs_to :teacher, dependent: :destroy
end
