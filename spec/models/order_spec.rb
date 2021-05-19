require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do

    
    @order_delivery = FactoryBot.build(:order)
  end

  context '内容に問題がない場合' do
    it "建物以外のカラムが全て存在する時、保存できる←後で正式に記述" do
      expect(@order).to be_valid
    end
    it "郵便番号にハイフンが含まれている時、保存できる" do
      expect(@order).to be_valid
    end
    it "電話番号が、半角の数字かつ、11桁以内なら、保存できる" do
      expect(@order).to be_valid
    end
    it "都道府県のIDが2〜47なら、保存できる" do
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では保存ができないこと" do
      @order.token = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it "postal_codeが空では保存ができないこと" do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("PostalCode can't be blank")
    end
    it "delivery_area_idが空では保存ができないこと" do
      @order.delivery_area_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("DeliveryAreaId can't be blank")
    end

  end
end
