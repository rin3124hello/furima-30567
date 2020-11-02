class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  with_options presence: true do
    validates :nickname 
    validates :birthday
    validates :first_name, format: { with: /\A[ぁーんァ-ン一-饅]+\z/, message: "は全角で入力してください" }
    validates :last_name, format: { with: /\A[ぁーんァ-ン一-饅]+\z/, message: "は全角で入力してください" }
    validates :first_name_kana, format: { with:/\A[ぁーんァ-ン一-饅]+\z/, message: "はカタカナで入力してください" }
    validates :last_name_kana, format: { with: /\A[ぁーんァ-ン一-饅]+\z/, message: "はカタカナで入力してください" }
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字で入力してください'    #カリキュラムでも紹介されているバリデーション
  end
end
