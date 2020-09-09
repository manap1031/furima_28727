FactoryBot.define do
  factory :user_purchase do
    token { '4242424242424242' }
    postal_code { '123-4567' }
    shipping_area_id { 1 }
    municipalities { '北海道' }
    address_number { '青山1-1-1' }
    phone_number { '09012345678' }
  end
end
