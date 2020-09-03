class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :create, :show, :oder]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy
  end


 def order
  ItemOrder.create(item_id: params[:id])
  redirect_to root_path
end

def find_item
  @item = Item.find(params[:id])
end

  private

  def item_params
    params.require(:item).permit(:item_name, :describe, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to '/users/sign_in' unless user_signed_in?
end
end
