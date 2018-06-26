class Teacher < ApplicationRecord
  belongs_to :registrant, dependent: :destroy
  has_many :teachers_title
  accepts_nested_attributes_for :registrant
end
