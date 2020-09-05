class Address < ApplicationRecord

  belongs_to :item
  
  validates  :postal_code, presence: true
  validates  :prefectures_id, presence: true
  validates  :municipalities, presence: true
  validates :shipping_area_id, presence: true
  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/} do
  validates :addres_number, presence: true
  end

  with_options presence: true, format: { with: /\A\d{11}\z/} do
  validates :phone_number, presence: true
  end

end
