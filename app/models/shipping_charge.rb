class ShippingCharge < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '着払い(お客様負担)' },
    { id: 3, name: '送料込み(出品者負担)' }
  ]
 end
