class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :set_redirect, only: [:index]
  before_action :two_redirect, only: [:index]

  def index
    @buy_sipping = BuySipping.new
  end

  def create
    @buy_sipping = BuySipping.new(private_params)
    if @buy_sipping.valid?
      pay_item
      @buy_sipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def private_params
    params.require(:buy_sipping).permit(:postal_code, :area_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: private_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_redirect
    redirect_to root_path if current_user.id == @item.user_id
  end

  def two_redirect
    redirect_to root_path if @item.buy.present?
  end

end
