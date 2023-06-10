class CreditCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_credit_card, only: %i[ edit update ]

  # GET /credit_cards/1/edit
  def edit
  end

  # PATCH/PUT /credit_cards/1 or /credit_cards/1.json
  def update
    respond_to do |format|
      if @credit_card.update(credit_card_params)
        format.html { redirect_to my_account_path, notice: "Credit card was successfully updated." }
        format.json { render :show, status: :ok, location: @credit_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_card
      @credit_card = CreditCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def credit_card_params
      params.require(:credit_card).permit(:number, :month, :year, :cvv)
    end
end
