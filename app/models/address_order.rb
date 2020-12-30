class AddressOrder
  include ActiveModel::Model
  attr_accessor :postnum, :city, :housenum, :building, :tel, :prefecture_id, :token, :user_id, :item_id

  with_options presence: true do 
    validates :postnum, format: {with: /\A\d{3}[-]\d{4}\z/ } 
    validates :city
    validates :housenum
    validates :tel
    validates :token
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :prefecture_id
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postnum: postnum, city: city, housenum: housenum, building: building, tel: tel, prefecture_id: prefecture_id, order_id: order.id)
  end
end