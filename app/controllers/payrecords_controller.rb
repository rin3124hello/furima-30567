class PayrecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_address  = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(payrecord_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def payrecord_params
    params.require(:purchase_address).permit(:postal_code, :region_id, :city, :house_name, :address_number, :phone_number, :purchase_record).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
