class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @order = Purchase.new
    @item = Item.find(params[:item_id])
    @address = Address.new
    @purchase = UserPurchase.new
    if @item.purchase != nil
      return redirect_to root_path
    end
  end
    

    def create
      @item = Item.find(params[:item_id])
      @purchase = UserPurchase.new(address_params)
      
      if @purchase.valid?
        pay_item
        @purchase.save
        return redirect_to root_path
      else
        render 'index'
      end
    end
  
  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency:'jpy'
    )
  end

  # def order_params
  #   params.permit(:@item_price, :token, :card_number, :exp_month, :exp_year, :cvc, :user_id).merge(user_id: current_user.id)
  # end

  def address_params
    params.require(:user_purchase).permit(:postal_code, :shipping_area_id, :municipalities, :address_number, :building, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id] )
  end

  def move_to_index
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
