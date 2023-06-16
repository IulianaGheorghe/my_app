class Product < ApplicationRecord
    belongs_to :category 
    has_one_attached :image
    has_many :orders
    has_many :orderables
    has_many :carts, through: :orderables
end
