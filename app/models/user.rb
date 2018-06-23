class User < ApplicationRecord
	has_one :student, dependent: :destroy, autosave: true
	has_one :registrant, dependent: :destroy, inverse_of: :user, autosave: true
end
