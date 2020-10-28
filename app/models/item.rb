class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :day

  validates :title, :text, :price, presence: true
  validates :category_id, condition_id, :postage_id, :region_id, :day_id, numericality: { other_than: 1 }
end
