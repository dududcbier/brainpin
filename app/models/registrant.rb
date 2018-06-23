class Registrant < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one :teacher, dependent: :destroy, inverse_of: :registrant, autosave: true
  accepts_nested_attributes_for :user
end
