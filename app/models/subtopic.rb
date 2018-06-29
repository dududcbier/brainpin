class Subtopic < ApplicationRecord
  belongs_to :topic
  belongs_to :learnable, dependent: :destroy

  def name
  	self.learnable.name
  end
end
