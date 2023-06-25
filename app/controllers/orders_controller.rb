class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, except: [:show, :create, :index]
  before_action :set_order, only: %i[ show edit update destroy ]

  include Pagy::Backend
  # GET /orders or /orders.json
  def index
    orders = Order.includes(:user).all
    unless current_user.admin?
      orders = orders.where(user_id: current_user.id)
    end
    orders = orders.where(status: params[:status]) if params[:status].present?
    @pagy, @orders = pagy(orders)
  end

  # GET /orders/1 or /orders/1.json
  def show
    unless current_user.admin?
      if (@order.user_id==current_user.id)
        render :show
      else
        redirect_to orders_path
      end
    end
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    if (!current_user.shipping_address.city.present?)
      redirect_to my_account_path, danger: "To make a purchase you have to complete your shipping address details first!"
    elsif (!current_user.billing_address.city.present?)
      redirect_to my_account_path, danger: "To make a purchase you have to complete your billing address details first!"
    elsif (!current_user.credit_card.number.present?)
      redirect_to my_account_path, danger: "To make a purchase you have to complete your credit card details first!"
    else
      @order = Order.new(order_params)
      @user = User.find_by_id(order_params[:user_id])
      respond_to do |format|
        if @order.save

          @user.cart.orderables.each do |orderable| 
            @product = Product.find_by(id: orderable.product.id)
            @order.ordered_products.create(product: @product, quantity: orderable.quantity)
            Orderable.find_by(id: orderable.id).destroy
          end

          OrderMailer.send_email(current_user, @order).deliver_now
          format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if order_params[:tracking_number].present? && @order.update(tracking_number: order_params[:tracking_number], status: "shipped")
        format.html { redirect_to order_url(@order), notice: "Order was successfully shipped." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = OFF;")
    @order.destroy
    ActiveRecord::Base.connection.execute("PRAGMA foreign_keys = ON;") # Re-enable foreign key constraints

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def export_csv
    csv_data = CSV.generate do |csv|
      csv << ["ID", "User", "Status", "Tracking Number"]

      orders = Order.includes(:user).all
      orders.each do |order|
        csv << [order.id, order.user.email, order.status, order.tracking_number]
      end
    end
    headers['Content-Type'] = 'text/csv'
    headers['Content-Disposition'] = "attachment; filename=orders-#{Date.today.to_s}.csv"
    render plain: csv_data
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:id, :user_id, :status, :tracking_number)
    end
end
