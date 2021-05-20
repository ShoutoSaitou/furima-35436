class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:index, :show]
  before_action :sold_confirmation, only: [:edit, :destroy,:update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :exhibitor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to :show
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :description,
      :category_id,
      :condition_id,
      :shipping_charge_id,
      :delivery_area_id,
      :days_to_ship_id,
      :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_order
    @order = Order.all
  end

  def exhibitor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def sold_confirmation
    redirect_to root_path if @order.find_by(item_id: @item.id)
  end
end
