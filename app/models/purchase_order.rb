class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_id, :city, :street_address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :region_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is valid. Input only number' }
    validates :token
  end
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is too short' }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(post_code: post_code, region_id: region_id, city: city, street_address: street_address,
                 building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end