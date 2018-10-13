class User < ApplicationRecord
	has_many :posts
	has_many :comments
	accepts_nested_attributes_for :posts

	# Validations
	validates :username, uniqueness: true
	validates :password, uniqueness: true
	validates :first_name, uniqueness: true
	validates :last_name, uniqueness: true
end
