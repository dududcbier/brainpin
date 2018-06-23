class LevelsPoint < ApplicationRecord
  belongs_to :learnable, dependent: :destroy
end
