class PurchaseRecord < ApplicationRecord
  belongs_to :item
  has_one_attached :address
end
