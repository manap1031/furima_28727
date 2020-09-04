class Address < ApplicationRecord
  belongs_to :purchase
  
  validates :postal_code, presence: true
  validates :prefectures_id, presence: true
  validates :municipalities, presence: true
  validates :addres_number, presence: true
  validates :building
  validates :phone_number, presence: true
end
