class PurchaseRecordDelivery
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :municipality, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :delivery_area_id
    validates :municipality
    validates :address
    validates :building
    validates :phone_number
    # validates :order_id
    validates :user_id
    validates :item_id
  end

  def save
    

  end
end