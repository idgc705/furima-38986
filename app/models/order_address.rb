class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :order_id, :token

  with_options presence: true do
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Postcode is invalid. Include hyphen(-)' }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{9,12}\z/ }, length: {maximum: 12}
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city,
                   block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end