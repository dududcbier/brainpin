class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :text, type: String
  field :liked_by, type: Array
  field :created_by, type: String
  recursively_embeds_many 
end
