class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :day
  belongs_to :deliverypay
  belongs_to :prefecture

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :category_id
    validates :condition_id
    validates :deliverypay_id
    validates :prefecture_id
    validates :day_id
  end

  with_options format: { with: /\A[0-9]+\z/ } do  # 半角数字指定
    validates :price
  end

  validates :price, numericality:{ greater_than: 299, less_than: 10000000 }

end
