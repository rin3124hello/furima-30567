FactoryBot.define do
  factory :purchase_address do
    postal_code       {"343-0843"}
    region_id         {12}
    city              {"越谷市"}
    house_name        {"ブロンズルーフ201"}
    address_number    {"蒲生茜町27-1"}
    phone_number      {"08012345678"}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
