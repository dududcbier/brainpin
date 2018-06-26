class Solution
  include Mongoid::Document
  field :text, type: String
  embedded_in :right_answer
end
