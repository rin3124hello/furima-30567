class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path, action: :move_to_index
    else
      render :new
    end
  end

  private

  def item_params
    params.permit(:name, :image, :text, :category_id, :condition_id, :postage_id, :region_id, :day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end