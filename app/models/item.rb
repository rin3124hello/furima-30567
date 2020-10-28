class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :item
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :condition, :postage, :region, :day

  validates :title, :text, :category, :price, presence: true
  validates :condition_id, :postage_id, :region_id, :day_id, numericality: { other_than: 1 }
end
