class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  hankaku_eisuji = /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, inclusion: { in: ["@"] }
  validates :encrypted_password, presence: true, length: { minimum: 6 }, confirmation: true, format: { with: hankaku_eisuji }

  
end
