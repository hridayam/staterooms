class Message < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :subject,   presence: true
  validates :content,   presence: true
  validates :sender,    presence: true
  validates :recipient, presence: true
end
