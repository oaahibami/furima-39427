FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2)}
    email                 { Faker::Internet.free_email}
    password              { "Abc123#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password}
    last_name             { "山田たろうタロウ" }
    first_name            { "山田たろうタロウ" }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' } 
    date_of_birth         { '1990-01-01' }
  end
end