class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, format: { with: /\A[ぁーんァ-ン一-饅]+\z/, message: "は全角で入力してください" }
    validates :last_name, format: { with: /\A[ぁーんァ-ン一-饅]+\z/, message: "は全角で入力してください" }
    validates :first_name_kana, format: { with:/\A[ぁーんァ-ン一-饅]+\z/, message: "はカタカナで入力してください" }
    validates :last_name_kana, format: { with: /\A[ぁーんァ-ン一-饅]+\z/, message: "はカタカナで入力してください" }
    validates :password, format: { with: /\A[ぁーんァ-ン一-饅]+\z/, message: "は半角英数字で入力してください" }
  end
end
