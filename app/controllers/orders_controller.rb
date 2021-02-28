class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @order_address = OrderAddress.new
    @item = Item.find(params[:id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    binding.pry
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
