require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品データの保存' do
    context "商品データが保存できる場合" do
      it "商品名と本文、画像と価格があれば保存される" do
        expect(@item).to be_valid
      end
    end

    context "商品データが保存できない場合" do
      it "商品名がないと保存できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end     
      it "本文がないと保存できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end     
      it "価格がないと保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "カテゴリーについての情報がないと保存できない" do
        @item.category = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "商品の状態についての情報がないと保存できない" do
        @item.condition = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it "送料の負担についての情報がないと保存できない" do
        @item.postage = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage is not a number")
      end
      it "発送元の地域についての情報がないと保存できない" do
        @item.region = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region is not a number")
      end
      it "発送までの日数についての情報がないと保存できない" do
        @item.day = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day is not a number")
      end
      it "価格の範囲が¥300~¥9,999,999でないと保存できない" do
        @item.price = "20"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が半角数字でないと保存できない" do
        @item.price = "９００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
