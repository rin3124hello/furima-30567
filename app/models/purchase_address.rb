class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :region_id, :postal_code, :city, :house_name, :address_number, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid."}
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address_number
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/, message: "is invalid."}
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id, city: city, house_name: house_name, address_number: address_number, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end