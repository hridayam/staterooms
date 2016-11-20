class Post < ApplicationRecord
	belongs_to :user
	has_many :comments
	validates :title, presence: true, length: { maximum: 50 }
	validates :post, presence: true
	validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
