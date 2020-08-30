class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :describe, :category_id, :condition_id, :shippong_charge_id, :shipping_area_id, :shipping_day_id, :price).marge(user_id: current_user.id)
  end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
    end
  end

end
