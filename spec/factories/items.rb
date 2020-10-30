FactoryBot.define do
  factory :item do
    name         {Faker::Lorem.sentence}
    text         {Faker::Lorem.sentence}
    category_id     {2}
    condition_id    {2}
    postage_id      {2}
    region_id       {2}
    day_id          {2}
    price        {77777}
    association :user
  end
end
