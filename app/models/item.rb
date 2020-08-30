class Item < ApplicationRecord

  belongs_to :user

  validates :item_name, presence: true
  validates :describe, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shippong_charge_id, presence: true
  validates :shipping_area_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true
  validates :user,presence: true
end
