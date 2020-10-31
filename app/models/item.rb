class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :purchase_record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :day

  validates :name, :text, :price, :image, presence: true
  validates :price, 
    numericality: {
      with: /\A[0-9]+\z/ ,
      greater_than_or_equal_to: 300,
      less_than_or_equal_to: 9999999
    }
  validates :category_id, :condition_id, :postage_id, :region_id, :day_id, numericality: { other_than: 1 }
end
