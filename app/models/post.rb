class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :text, type: String
  field :created_by, type: String
  embeds_many :comments
end
