class User < ApplicationRecord
	has_many :posts
	has_many :comments
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :password, presence: true,length: { minimum: 8 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@sjsu.edu+\z/i
	validates :email, presence: true, uniqueness: {case_sensitive: false},
						format: {with: VALID_EMAIL_REGEX}
	has_secure_password

	before_save :downcase_fields

	def downcase_fields
      self.firstname.downcase!
			self.lastname.downcase!
			self.email.downcase!
  end
end
