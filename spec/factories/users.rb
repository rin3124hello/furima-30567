FactoryBot.define do
  factory :user do
    
    nickname            {Faker::Name.initials}
    email               {Faker::Internet.free_email}
    password            {Faker::Internet.password(min_length: 6)}
    encrypted_password  {password}
    first_name          {Faker::Name.first_name}
    last_name           {Faker::Name.last_name}
    birthday            {Faker::Date.birthday}
  end
end
