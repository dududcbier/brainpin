class Topic < ApplicationRecord
  belongs_to :course
  belongs_to :learnable, dependent: :destroy
end
