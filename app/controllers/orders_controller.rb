class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index

  def index
    @order = Purchase.new
    @address = Address.new
    @purchase = UserPurchase.new
    return redirect_to root_path unless @item.purchase.nil?
  end

  def create
    @purchase = UserPurchase.new(address_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def address_params
    params.require(:user_purchase).permit(:postal_code, :shipping_area_id, :municipalities, :address_number, :building, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end
end
