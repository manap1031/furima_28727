class ItemsController < ApplicationController
  # before_action :authenticate_user!, expext: [:index]
  def index
    @items = Item.all
  end
end
