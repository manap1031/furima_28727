class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string       :postal_code,      null: false
      t.string       :municipalities,   null: false
      t.string       :address_number,    null: false
      t.string       :building
      t.string       :phone_number,     null: false
      t.integer      :shipping_area_id, null: false
      t.references   :item,             foreign_key: true
      # t.references   :user,             foreign_key: true
      t.timestamps   
    end
  end
end
