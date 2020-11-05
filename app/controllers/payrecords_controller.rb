class PayrecordsController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @purchase_address  = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(payrecord_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def payrecord_params
    params.require(:purchase_address).permit(:postal_code, :region_id, :city, :house_name, :address_number, :phone_number, :purchase_record, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
    
  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index 
    if current_user.id == @item.user_id || @item.purchase_record.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: payrecord_params[:token],
        currency: 'jpy')
    end
  end