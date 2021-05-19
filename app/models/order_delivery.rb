class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :delivery_area_id
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A^0\d{9,10}$\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(
      postal_code: postal_code,
      delivery_area_id: delivery_area_id,
      municipality: municipality,
      address: address,
      building: building,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
