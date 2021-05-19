FactoryBot.define do
  factory :order_delivery do
    token {"tok_abcdefghijk00000000000000000"}

    postal_code { '064-0807' }
    delivery_area_id { 2 }
    municipality { '札幌市中央区' }
    address { '1032'}
    building { '任意'}
    phone_number { '09012345678' }

  end
end