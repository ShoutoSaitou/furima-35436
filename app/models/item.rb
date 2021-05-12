class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :delivery_area
  belongs_to :days_to_ship
  
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :delivery_area_id
    validates :days_to_ship_id
    validates :price
    validates :image
  end
  validates_inclusion_of :price, in:300..9999999
  validates :price, format: {with: /^[0-9]+$/ }

end
