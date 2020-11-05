class PayrecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    elsif
      @item.purchase_record.present?
    else
      @purchase_address  = PurchaseAddress.new
    end
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: payrecord_params[:token],
        currency: 'jpy')
    end
  end