class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]

  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  def add
    @cart = current_user.cart
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_f
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity: current_orderable.quantity + 1)
    else 
      @cart.orderables.create(product: @product, quantity: 1)
    end

    if @cart.save
      redirect_to product_url(@product), success: "Product successfully added to cart!"
    end
  end

  def update_quantity
    @cart = current_user.cart
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_f
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity: quantity)
    elsif quantity <= 0
      current_orderable.destroy
    end

    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to my_cart_path }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to my_cart_path }
      format.json { head :no_content }
    end
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/1/edit
  def edit
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find_or_create_by(user_id: current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end
end
