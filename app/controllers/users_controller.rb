class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin, except: [:show]
  def index
    @users = User.all
  end

  def show
    @user = current_user
    if @user.shipping_address.nil?
      address = ShippingAddress.create(user_id: @user.id)
      address.save
      @user.shipping_address = address
    end
    if @user.billing_address.nil?
      address = BillingAddress.create(user_id: @user.id)
      address.save
      @user.billing_address = address
    end

    if @user.credit_card.nil?
      card = CreditCard.create(user_id: @user.id)
      card.save
      @user.credit_card = card
    end

    @shipping_address = @user.shipping_address
    @billing_address = @user.billing_address
    @credit_card = @user.credit_card
  end
end
