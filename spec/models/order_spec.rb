require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '内容に問題ない場合' do
    it 'itemがあれば保存ができること' do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'priceが空では保存ができないこと' do
      @order.item = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
  end
end
