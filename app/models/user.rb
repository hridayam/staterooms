class User < ApplicationRecord
  has_many :listings
  has_many :comments

  before_create :confirmation_token
  
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@sjsu.edu+\z/i

	validates :firstname, presence: true
	validates :lastname,  presence: true
	validates :password,  presence: true, length: { minimum: 8 }
	validates :email,     presence: true, uniqueness: {case_sensitive: false},
						  format: { with: VALID_EMAIL_REGEX }
	has_secure_password

	before_save :downcase_fields

	def downcase_fields
    self.firstname.downcase!
	  self.lastname.downcase!
	  self.email.downcase!
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end
