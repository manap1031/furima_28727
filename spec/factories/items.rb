FactoryBot.define do
  factory :item do
    item_name {'hoge'}
    describe {'hogehoge'}
    category_id {1}
    condition_id {1}
    shipping_charge_id {1}
    shipping_area_id {1}
    shipping_day_id {1}
    price {"35000"}
    user_id {1}
  end
end