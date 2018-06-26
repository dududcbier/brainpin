class MongoQuestion
  include Mongoid::Document
  field :difficulty, type: Integer
  field :points, type: Integer
  field :text, type: String

  after_save :create_question
  
  embeds_one :right_answer
  embeds_many :wrong_answers

  accepts_nested_attributes_for :right_answer, :wrong_answers

  def create_question
  	Question.create mongo_id: self._id, registrant_id: 1
  end
end
