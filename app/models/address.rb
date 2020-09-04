class Address < ApplicationRecord
  belongs_to :purchase

  validates :postal_code, presence: true
  validates :prefectures_id, presence: true
  validates :municipalities, presence: true

  with_options presence: true, format: {/\A\d{3}[-]\d{4}\z/}do
  validates :addres_number, presence: true
  end

  validates :building


  with_options presence: true, format: {/\A\d{11}\z/} do
  validates :phone_number, presence: true
  end

end
