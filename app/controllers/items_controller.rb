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
  params.require(:item).permit(:image).merge(user_id: current_user.id)
end
