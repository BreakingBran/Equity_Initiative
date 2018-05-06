class Comment < ApplicationRecord
	belongs_to :post, :foreign_key => 'comment_id'
	belongs_to :user, :foreign_key => 'user_id'
	has_many :replies
end
