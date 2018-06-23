class Learnable < ApplicationRecord
  belongs_to :coordinator
  has_many :levels_point
  belongs_to :avatar_requirement
end
