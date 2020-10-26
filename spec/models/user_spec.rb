require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      end
      it "メールアドレスに@があれば登録できる" do
      end
      it "passwordが6文字以上であれば登録できる" do
    end

    context '本人情報確認がうまくいくとき' do
      it "farst_nameとlast_nameが存在すれば登録できる" do
      end
      it "first_name_kanaとlast_name_kanaが存在すれば登録できる"
      end
      it "birthdayが存在すれば登録できる"
      end
    end
  end
end
