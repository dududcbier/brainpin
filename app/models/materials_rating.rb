class MaterialsRating < ApplicationRecord
  belongs_to :student, dependent: :detroy
  belongs_to :material, dependent: :detroy
end
