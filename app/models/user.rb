class User < ApplicationRecord
	has_many :posts
	has_many :comments
	validates :password, presence: true,length: { minimum: 8 }
	validates :email, presence: true
end
