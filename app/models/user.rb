class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  #validates :password, confirmation: true, format: { with: /^(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$/ }  #半角英数字含む６文字以上

  with_options confirmation: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/, message: "must be both letters and numbers" } do #半角英数字含む６文字以上 
   validates :password
  end

  with_options presence: true do
    validates :nickname
    validates :email
    validates :lastname
    validates :firstname
    validates :furigana_last
    validates :furigana_first
    validates :birthday
  end

  with_options format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'must be Full-width' } do   # 全角(漢字、カタカナ、ひらがな)指定
    validates :lastname
    validates :firstname
  end

  with_options format: {with: /\A[ァ-ヶー－]+\z/, message: "must be Full-width katakana characters" } do   # 全角カタカナ指定
    validates :furigana_last
    validates :furigana_first
  end
end