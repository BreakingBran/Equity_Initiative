class Reply < ApplicationRecord
	belongs_to :comment, :foreign_key => 'comment_id'
end
