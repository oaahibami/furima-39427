class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :region
  belongs_to :shipping_day
  has_one_attached :image
  belongs_to :user
  has_one    :purchase

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1  , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1  , message: "can't be blank"}
  validates :shipping_fee_id, numericality: { other_than: 1  , message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1  , message: "can't be blank"}
  validates :shipping_day_id, numericality: { other_than: 1  , message: "can't be blank"}

  validates :price, presence: true, numericality: { 
    only_integer: true, 
    greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9_999_999, 
    message: "is out of setting range"
  }

end