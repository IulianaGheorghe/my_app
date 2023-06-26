class WishlistProductController < ApplicationController

  def show
    @wishlist_products = current_user.wishlist_products
  end

  def add
    @product = Product.find_by(id: params[:id])
    current_user.wishlist_products.create(product: @product)

    current_path = request.fullpath
    if current_user.save
      redirect_to current_path, success: "Product successfully added to wishlist!"
    else
      redirect_to current_path, danger: "Product couldn't be added to wishlist! " 
    end
  end

  def remove
    current_user.wishlist_products.find_by(product_id: params[:id]).destroy
    current_path = request.fullpath
    if current_user.save
      redirect_to current_path, success: "Product successfully removed from wishlist!"
    else
      redirect_to current_path, danger: "Product couldn't be removed from wishlist! " 
    end
  end

end
