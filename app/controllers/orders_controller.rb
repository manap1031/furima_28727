class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end

  private

  def order_params
    prams.permit(:price, :token)
  end

  def address_params
    params.require(:address).permit(:postal_code, :prefectures_id, :municipalities, :addres_number, :building, :phone_number).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
