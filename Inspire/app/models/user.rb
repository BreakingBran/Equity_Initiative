class User < ApplicationRecord
	has_many :posts
	has_many :comments
	accepts_nested_attributes_for :posts

	# Validations
	validates :username, uniqueness: true
	validates :password, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true


	def authenticate(password)
    # could be more secure
    return self.password == password
	end
end
