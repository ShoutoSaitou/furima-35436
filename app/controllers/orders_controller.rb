class OrdersController < ApplicationController
before_action :set_item,only:[:index,:create]
before_action :sold_confirmation,only:[:index,:create]

  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:postal_code, :delivery_area_id, :municipality, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  def sold_confirmation
    @order= Order.all
    if @order.find_by(item_id: @item.id)
      redirect_to root_path
    end
  end
end
