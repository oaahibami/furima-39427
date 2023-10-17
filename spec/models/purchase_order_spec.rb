require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_order = FactoryBot.build(:purchase_order, user_id: @user, item_id: @item)
    sleep 0.1
  end

  describe '商品購入情報の保存' do
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_order.building_name = ''
        expect(@purchase_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_order.post_code = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_order.post_code = "1234567"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'regionを選択していないと保存できないこと' do
        @purchase_order.region_id = "1"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空白だと保存できないこと' do
        @purchase_order.city = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("City can't be blank")
      end
      it 'street_adressが空白だと保存できないこと' do
        @purchase_order.street_address = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空白だと保存できないこと' do
        @purchase_order.phone_number = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと保存できないこと' do
        @purchase_order.phone_number = "０９０１２３４５６７８"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is valid. Input only number", "Phone number is too short")
      end
      it 'phone_numberが10桁以上11桁以内でないと保存できないこと' do
        @purchase_order.phone_number = "090123456"
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberが10桁以上11桁以内でないと保存できないこと' do
        @purchase_order.phone_number = "090123456789"
          @purchase_order.valid?
          expect(@purchase_order.errors.full_messages).to include("Phone number is too short")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_order.user_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できないこと' do
        @purchase_order.item_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_order.token = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end