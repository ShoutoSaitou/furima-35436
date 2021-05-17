class Item < ApplicationRecord
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
  validates_inclusion_of :price, in: 300..9_999_999
  validates :price, format: { with: /\A[0-9]+\z/ }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :delivery_area_id
    validates :days_to_ship_id
  end
  belongs_to :user
  has_one_attached :image
  has_one :order

end
