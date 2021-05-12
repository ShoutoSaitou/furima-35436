class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new]
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    # params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
    params.require(:item).permit(
      :image,
      :name,
      :description,
      :category_id,
      :condition_id,
      :shipping_charge_id,
      :delivery_area_id,
      :days_to_ship_id,
      :price).merge(user_id: current_user.id)
  end
end