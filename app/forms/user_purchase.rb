class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :municipalities, :shipping_area_id, :address_number, :building, :phone_number, :token, :user_id, :item_id

  validates :municipalities, presence: true
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :address_number, presence: true

  with_options presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ } do
    validates :postal_code, presence: true
  end

  with_options presence: true, format: { with: /\A\d{11}\z/ } do
    validates :phone_number, presence: true
  end

  validates :token, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, municipalities: municipalities, shipping_area_id: shipping_area_id, address_number: address_number, building: building, phone_number: phone_number, item_id: purchase.id)
  end
end
