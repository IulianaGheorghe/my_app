class Product < ApplicationRecord
    belongs_to :category 
    has_one_attached :image
    has_many :orderables
    has_many :carts, through: :orderables
    has_many :ordered_products
end
