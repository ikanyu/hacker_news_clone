class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments
  has_many :post_votes
  belongs_to :user

  validates :title, presence: true

  def check_consistency(content,url)
  	if content.blank? and url.blank?
  		false
  	elsif !content.blank? and !url.blank?
  		false
  	else
  		true
  	end
  end	
end
