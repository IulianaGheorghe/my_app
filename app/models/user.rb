class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :shipping_address
  has_one :billing_address
  has_one :credit_card
  has_one :cart
  has_one_attached :profile_picture
  has_many :orders
  has_many :wishlist_products

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def admin?
    self.role == "admin"
  end

end
