FactoryBot.define do
  factory :item do
    name { 'テスト' }
    description { 'テスト説明' }
    category_id { 2 }
    condition_id { 2 }
    shipping_charge_id { 2 }
    delivery_area_id { 2 }
    days_to_ship_id { 2 }
    price { 500 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
