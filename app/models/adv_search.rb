class AdvSearch < ApplicationRecord
  validates :min_price, numericality: { greater_than_or_equal_to: 0 }
  validates :max_price, numericality: { greater_than_or_equal_to: 0 }
end
