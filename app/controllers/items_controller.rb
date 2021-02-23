class ItemsController < ApplicationController

  def show
    
  end

  def new
    @item = Item.new
  end

  def crate
    
  end
end

private

def item_params
  params.require(:item).permit(:image, :title, :text, :category_id, :status_id, :cost_id, :prefecture_id, :references_id).merge(user_id: current_user.id)
end
