require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailは@を含まなければ登録できない" do
        @user.email = "hoge.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000"
        # @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英数字混同でなければ登録できない" do
        @user.password = "hogehoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字で入力してください")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      #ユーザー本名は名字と名前がそれぞれ必須であること
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      #ユーザー本名は全角（漢字・ひらがな・カタカナ）での入力が必須であること
      it "first_nameは全角（カタカナ）でないと登録できない" do
        @user.first_name = "ai"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角で入力してください")
      end
      it "last_nameは全角（カタカナ）でないと登録できない" do
        @user.last_name = "yamamoto"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角で入力してください")
      end

      #ユーザー本名のフリガナは名字と名前でそれぞれ必須であること"
      it "first_nameが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      #ユーザーのフリガナは全角（カタカナ）での入力が必須であること
      it "first_name_kanaは全角（カタカナ）でないと登録できない" do
        @user.first_name_kana = "あい"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana はカタカナで入力してください")
      end
      it "last_name_kanaは全角（カタカナ）でないと登録できない" do
        @user.last_name_kana = "やまもと"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana はカタカナで入力してください")
      end

      it "生年月日が必須であること" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

# エラーが出た時はまずモデルのバリデーションを疑う、というのもテストの目的自体がモデルのバリデーションが合っているかどうかのもの
# Factoryがあっていても、モデルがNGならエラーが出るし挙動に問題が起きる