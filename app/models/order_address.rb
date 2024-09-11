class OrderAddress
  include ActiveModel::Model
  attr_accessor :token
  attr_accessor :user_id, :item_id, :postal_code, :token, :shipping_from_id, :city, :address_line1, :address_line2, :phone_number

  with_options presence: true do
    validates :user_id, :item_id, :postal_code, :shipping_from_id, :city, :address_line1, presence: true
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'input correctly' }
    validates :shipping_from_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'input only number' }
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id) # rubocop:disable Style/HashSyntax
    Address.create(postal_code: postal_code, shipping_from_id: shipping_from_id, city: city, address_line1: address_line1, address_line2: address_line2, phone_number: phone_number, order_id: order.id) # rubocop:disable Style/HashSyntax
  end
end