class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.order("created_at")
  end

  def new
    @item = Item.new
  end

  def create
    Post.create(item: params[:item])
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :text, :category_id, :condition_id, postage_id, region_id, days_id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
