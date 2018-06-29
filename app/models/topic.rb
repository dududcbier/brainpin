class Topic < ApplicationRecord
  belongs_to :course
  belongs_to :learnable, dependent: :destroy

  def name
  	self.learnable.name
  end
end
