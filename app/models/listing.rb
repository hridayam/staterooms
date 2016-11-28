class Listing < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("description LIKE ?", "%#{search}%")
    where("address LIKE ?", "%#{search}%")
  end
end
