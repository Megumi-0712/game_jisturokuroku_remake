class Blog < ApplicationRecord

	belongs_to :user
	has_many :blog_comments, dependent: :delete_all

	validates :title, presence: true
	validates :body, presence: true
end
