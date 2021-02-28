class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order = Order.new
    @item = Item.find(params[:format])
  end

  def create
    if @order.create
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def order_params
    params.require(:user_id, :item_id).merge(user_id: current_user.id)
  end
end
