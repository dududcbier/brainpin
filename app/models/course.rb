class Course < ApplicationRecord
  belongs_to :learnable, dependent: :destroy
end
