class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :region_id, :postal_code, :city, :house_name, :address_number, :phone_number, :purchase_record, :token

  validates :price, presence: true
  validates :token, presence: true

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid."}
    validates :region_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address_number
    validates :phone_number, format: { with: /0[0-9]{1,4}[0-9]{1,6}([0-9]{0,5})?/, message: "is invalid."}
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, house_name: house_name, address_number: address_number, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end