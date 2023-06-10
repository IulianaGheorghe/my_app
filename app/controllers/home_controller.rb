class HomeController < ApplicationController
    def new
        @products = Product.all.with_attached_image.order(:name)
    end
end