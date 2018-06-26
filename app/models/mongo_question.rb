class MongoQuestion
  include Mongoid::Document
  field :topics, type: Array
  field :difficulty, type: Integer
  field :points, type: Integer
  field :text, type: String

  embeds_one :right_answer
  embeds_many :wrong_answers

  accepts_nested_attributes_for :right_answer, :wrong_answers, :allow_destroy => true

end
