class AvatarRequirement < ApplicationRecord
  belongs_to :avatar
  has_one :learnable
end
