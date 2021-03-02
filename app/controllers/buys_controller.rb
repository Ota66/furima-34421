class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buy_sipping = BuySipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_sipping = BuySipping.new(private_params)
    if @buy_sipping.valid?
      @buy_sipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def private_params
    params.require(:buy_sipping).permit(:postal_code, :area_id, :municipality, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

end
