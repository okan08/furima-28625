class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  hankaku_eisuji = /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  #validates :password, length: { minimum: 6 }, confirmation: true #format: { with: hankaku_eisuji }
  validates :lastname, :firstname, presence: true  # 全角(漢字・ひらがな・カタカナ)での入力指定
  validates :furigana_last, :furigana_first, presence: true # 全角カタカナ指定
  validates :birthday, presence: true
  



end
