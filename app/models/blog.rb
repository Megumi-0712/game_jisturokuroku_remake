class Blog < ApplicationRecord

	belongs_to :user
	has_many :post_comments, dependent: :delete_all

	validates :title, presence: true
	validates :body, presence: true
end
