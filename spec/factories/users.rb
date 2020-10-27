FactoryBot.define do

  factory :user do
    nickname            {Faker::Name.initials}
    email               {Faker::Internet.free_email}
    password            { '1a' + Faker::Internet.password(min_length: 6, max_length: 20) }
    # encrypted_password  {password}
    first_name          {"太郎"}
    first_name_kana     {"タロウ"}
    last_name           {"山田"}
    last_name_kana      {"ヤマダ"}
    birthday            { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today)} 
  end

end
