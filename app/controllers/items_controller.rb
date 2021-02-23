class ItemsController < ApplicationController

  def show
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

def item_params
  params.require(:item).permit(:image, :title, :text, :category_id, :status_id, :cost_id, :prefecture_id, :response_id,
                               :price).merge(user_id: current_user.id)
end
