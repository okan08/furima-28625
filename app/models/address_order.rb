class AddressOrder
  include ActiveModel::Model
  attr_accessor :postnum, :city, :housenum, :building, :tel, :prefecture_id, :token, :user_id, :item_id

  validates :tel, format: { with: /\A[0-9]+\z/, message: 'must be only numbers' }#全て数値でなければならない

  with_options presence: true do
    validates :postnum, format: { with: /\A\d{3}-\d{4}\z/ } #ハイフンを含まなければならない
    validates :city
    validates :housenum
    validates :tel, length: {maximum: 11}
    validates :token
    validates :user_id
    validates :item_id
  end


  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :prefecture_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postnum: postnum, city: city, housenum: housenum, building: building, tel: tel, prefecture_id: prefecture_id, order_id: order.id)
  end
end
