class StudentLevel < ApplicationRecord
  belongs_to :learnable, dependent: :destroy
  belongs_to :student, dependent: :destroy
end
