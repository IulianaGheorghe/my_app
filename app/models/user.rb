class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :shipping_address
  has_one :billing_address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
