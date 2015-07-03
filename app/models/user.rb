class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments
  has_many :posts
  has_many :post_votes
  has_many :comment_votes

  validates :username, :password, presence: true
  validates :username, uniqueness: true

  def check_password(password)
		if self.password == password
			true
		else
			false
		end
	end
end
