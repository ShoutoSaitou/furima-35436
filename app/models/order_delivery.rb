class OrderDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :municipality, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :delivery_area_id
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
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
