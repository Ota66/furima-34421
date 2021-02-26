class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(private_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def private_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end
end
