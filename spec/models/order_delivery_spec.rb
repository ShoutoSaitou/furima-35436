require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
    @item.save
    @order_delivery = FactoryBot.build(:order_delivery, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  context '内容に問題がない場合' do
    it "建物以外のカラムが全て存在する時、保存できる←後で正式に記述" do
      expect(@order_delivery).to be_valid
    end
    it "postal_codeがハイフン込みの数字なら保存できる" do
      expect(@order_delivery).to be_valid
    end
    it "phone_numberが半角の数値かつ11桁以内なら保存できる" do
      expect(@order_delivery).to be_valid
    end
    it "delivery_area_idが2〜47なら登録できる" do
      expect(@order_delivery).to be_valid
    end

  end

  context '内容に問題がある場合' do
    it "tokenが空では保存ができない" do
      @order_delivery.token = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
    end
    it "postal_codeが空では保存ができない" do
      @order_delivery.postal_code = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Postal code can't be blank")
    end
    it "delivery_area_idが空では保存ができない" do
      @order_delivery.delivery_area_id = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Delivery area can't be blank")
    end
    it "municipalityが空では保存ができない" do
      @order_delivery.municipality = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Municipality can't be blank")
    end
    it "addressが空では保存ができない" do
      @order_delivery.address = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
    end
    it "phone_numberが空では保存ができない" do
      @order_delivery.phone_number = ''
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
    end
    it "postal_codeにハイフンが含まれていない場合、保存ができない" do
      @order_delivery.postal_code = '0640807'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Postal code is invalid")
    end
    it "phone_numberが11桁以内でない場合は保存ができない" do
      @order_delivery.phone_number = '0123456789012'
      @order_delivery.valid?
      expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
