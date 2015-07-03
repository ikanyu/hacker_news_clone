class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :post
  belongs_to :user
  has_many :comment_votes
end
