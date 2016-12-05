class Listing < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  mount_uploader :cover, ListingsImageUploader
end
