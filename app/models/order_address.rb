class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :address, :building, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id, :item_id, :order_id, :city, :address, :phone_number
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_code: post_code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end