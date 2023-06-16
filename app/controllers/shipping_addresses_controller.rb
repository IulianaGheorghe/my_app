class ShippingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shipping_address, only: %i[ edit update ]

  # GET /shipping_addresses/1/edit
  def edit
  end

  # PATCH/PUT /shipping_addresses/1 or /shipping_addresses/1.json
  def update
    respond_to do |format|
      if @shipping_address.update(shipping_address_params)
        format.html { redirect_to my_account_path, notice: "Shipping address was successfully updated." }
        format.json { render :show, status: :ok, location: @shipping_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shipping_address.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_address
      @shipping_address = ShippingAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipping_address_params
      params.require(:shipping_address).permit(:id, :street_address, :city, :state, :postal_code, :country)
    end
end
