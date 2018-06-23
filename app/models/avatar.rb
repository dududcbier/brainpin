class Avatar < ApplicationRecord
	belongs_to :user
	has_many :avatar_requirements
end
