class Coordinator < ApplicationRecord
  belongs_to :registrant, dependent: :destroy
  has_many :learnable
  has_many :teacher
end
