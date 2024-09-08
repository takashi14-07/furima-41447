FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.characters(number: 40) }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_id { 2 }
    shipping_from_id { 2 }
    shipping_date_id { 2 }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
