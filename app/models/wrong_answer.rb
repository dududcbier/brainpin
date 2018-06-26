class WrongAnswer
  include Mongoid::Document
  field :text, type: String
  field :plausibility, type: Integer

  embedded_in :mongo_question
end
