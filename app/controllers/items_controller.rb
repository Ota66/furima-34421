class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(private_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(private_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  private

  def private_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

end
