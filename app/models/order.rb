class Order < ApplicationRecord
    belongs_to :user
    has_many :ordered_products
    has_many :products, through: :ordered_products

    def total
        ordered_products.to_a.sum { |product| product.total }
    end
end
