class ProductsByCategoryController < ApplicationController
    def new
        category_id = Category.where(name: params[:category_name]).first.id if params[:category_name].present?
        @products = Product.includes(:category).all
        @products = @products.where("products.name LIKE ? OR notes LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
        @products = @products.where(category_id: category_id) if params[:category_name].present?
        @products = @products.where(brand: params[:brand]) if params[:brand].present?
        if params[:sort_by_price] == 'Ascending'
            @products = @products.order(:price) 
        elsif params[:sort_by_price] == 'Descending'
            @products = @products.order(price: :desc) 
        end
        @products = @products.where(perfumetype: params[:perfumetype]) if params[:perfumetype].present?
        @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
    end
end