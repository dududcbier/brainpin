class RightAnswer
  include Mongoid::Document
  field :text, type: String
  embedded_in :mongo_question
  embeds_many :solutions
  accepts_nested_attributes_for :solutions
end
