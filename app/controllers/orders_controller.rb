class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @address = Address.new
  end
    

    def create
      @item = Item.find(params[:item_id])
      @address = Address.new(address_params)

      @order = Purchase.new(order_params)
      if @order.valid?
        pay_item
        @order.save
        return redirect_to root_path
      else
        render 'index'
      end
    end
  

  private

  def order_params
    params.permit(:@item_price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: oder_params[:token],
      currency:'jpy'
    )
  end

  def address_params
    params.require(:address).permit(:postal_code, :shipping_area_id, :prefectures_id, :municipalities, :addres_number, :building, :phone_number).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
