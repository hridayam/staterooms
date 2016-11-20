class User < ApplicationRecord
	has_many :posts
	has_many :comments

	validates :email, presence: true, format: { with: /\A\w+.\w+@sjsu.edu\z/, message: "isn't an SJSU email" }, uniqueness: true
    validates :firstname, presence: true
    validates :lastname, presence: true
	validates :password, presence: true, length: { minimum: 8 }, confirmation: true
    validates :password_confirmation, presence: true, length: { minimum: 8 }
end
