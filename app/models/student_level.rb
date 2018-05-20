class StudentLevel < ApplicationRecord
  belongs_to :learnable
  belongs_to :student
end
