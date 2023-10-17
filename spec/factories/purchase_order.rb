FactoryBot.define do
  factory :purchase_order do
    post_code { '123-4567' }
    region_id { "2" }
    city { '川口市' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { "09012345678" }
    token           { "tok_abcdefghijk00000000000000000" }
  end
end