class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id ||  @item.order.present? 
      redirect_to root_path
    end
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    
    if @order_address.valid?
      @order_address.save
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_from_id, :city, :address_line1, :address_line2,
                                          :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
