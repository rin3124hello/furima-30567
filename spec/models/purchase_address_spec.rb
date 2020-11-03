require 'rails_helper'

describe PurchaseAddress do
  before do
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '配送先の情報が保存できる' do
    context "配送先の情報が保存できる場合" do
      it "郵便番号、都道府県、市区町村、番地、電話番号があれば保存される" do
        expect(@purchase_address).to be_valid
      end
    end

    context "商品データが保存できない場合" do
      it "郵便番号がないと保存できない" do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("can't be blank")
      end     
      it "都道府県がないと保存できない" do
        @purchase_address.region_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("is invalid")
      end     
      it "市区町村がないと保存できない" do
        @purchase_address.city = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("can't be blank")
      end     
      it "番地がないと保存できない" do
        @purchase_address.address_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("can't be blank")
      end     
      it "電話番号がないと保存できない" do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("is invalid")
      end
      it "郵便番号にはハイフンがないと保存できない" do
        @purchase_address.phone_number = "1234567"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("is invalid")
      end
      it "電話番号にはハイフンがあると保存できない" do
        @purchase_address.phone_number = "090-1234-5678"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("is invalid")
      end
      it "電話番号は11桁でないと保存できない" do
        @purchase_address.phone_number = "09012345678"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("is invalid")
      end
    end
  end
end