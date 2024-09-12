FactoryBot.define do
  factory :order_address do
    postal_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    shipping_from_id { 2 }
    city { Gimei.city.kanji }
    address_line1 { Gimei.town.kanji }
    address_line2 { Gimei.town.kanji }
    phone_number { Faker::Number.number(digits: 11) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
