class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :day
  belongs_to :deliverypay
  belongs_to :prefecture

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :condition_id
    validates :deliverypay_id
    validates :prefecture_id
    validates :day_id
  end

  with_options format: { with: /\A[0-9]+\z/, message: 'must be half-width number and between 299-10000000' } do  # 半角数字指定
    validates :price
  end

  validates :price, numericality: { greater_than: 299, less_than: 10_000_000, message: 'must be half-width number and between 299-10000000' }
end
