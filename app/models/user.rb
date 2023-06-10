class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :shipping_address
  has_one :billing_address
  has_one :credit_card
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def admin?
    self.role == "admin"
  end

end
