FactoryBot.define do
  factory :item do
    name                  { "テスト商品（タイトル）"}
    description           { "テスト商品（詳細）"}
    category_id           { "2"}
    condition_id          { "2"}
    shipping_fee_id       { "2"}
    shipping_day_id       { "2"}
    region_id             { "2"}
    price                 { Faker::Number.number(digits: 4)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end