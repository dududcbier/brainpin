class QuestionMongo
  include Mongoid::Document
  field :difficulty, type: Integer
  field :points, type: Integer
  field :rating, type: Float
  field :text, type: String
  field :id_registrant, type: Integer
  field :comments, type: Array
end
