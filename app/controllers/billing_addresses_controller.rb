class BillingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_billing_address, only: %i[ edit update ]

  # GET /billing_addresses/1/edit
  def edit
  end

  # PATCH/PUT /billing_addresses/1 or /billing_addresses/1.json
  def update
    respond_to do |format|
      if @billing_address.update(billing_address_params)
        format.html { redirect_to billing_address_url(@billing_address), notice: "Billing address was successfully updated." }
        format.json { render :show, status: :ok, location: @billing_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @billing_address.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing_address
      @billing_address = BillingAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def billing_address_params
      params.require(:billing_address).permit(:street_address, :city, :state, :postal_code, :country, :user_id)
    end
end
