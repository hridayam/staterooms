class User < ApplicationRecord
	has_many :posts
	has_many :comments
	validates :password, presence: true,length: { minimum: 8 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@sjsu.edu+\z/i
	validates :email, presence: true, uniqueness: {case_sensitive: false},
						format: {with: VALID_EMAIL_REGEX}

end
