class Student < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one :avatar
  accepts_nested_attributes_for :user
end
