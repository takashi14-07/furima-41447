class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    return unless @item.order.present?

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :shipping_id, :shipping_from_id,
                                 :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def require_login
    return if current_user.id == @item.user_id

    redirect_to action: :index
  end
end
