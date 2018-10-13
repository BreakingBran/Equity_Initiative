class Post < ApplicationRecord
	has_many :comments
	belongs_to :user, :foreign_key => 'user_id'

	# Validations
	validates :title, uniqueness: true
	validates :user, presence: true
	validates :message, presence: true
	validates :category, presence: true
end
