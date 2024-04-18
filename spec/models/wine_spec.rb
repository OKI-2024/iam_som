require 'rails_helper'

RSpec.describe Wine, type: :model do
  before do
    @wine = FactoryBot.build(:wine)
  end

  describe 'バリデーションのテスト' do
    context '正常系' do
      it '名前と画像があれば有効' do
        expect(@wine).to be_valid
      end
    end

    context '異常系' do
      it '名前がないと無効' do
        @wine.name = nil
        @wine.valid?
        expect(@wine.errors[:name]).to include("ワイン名は必須です")
      end

      it '画像がないと無効' do
        @wine.image.detach  # アタッチされた画像をデタッチする
        @wine.valid?
        expect(@wine.errors[:image]).to include("画像は必須です")
      end

      it '無効な品種IDだと無効' do
        @wine.grape_variety_id = 1
        @wine.valid?
        expect(@wine.errors[:grape_variety_id]).to include("ブドウの品種を選択してください")
      end

      it '無効なタイプIDだと無効' do
        @wine.type_id = 1
        @wine.valid?
        expect(@wine.errors[:type_id]).to include("ワインのタイプを選択してください")
      end

      it '無効な生産地IDだと無効' do
        @wine.region_id = 1
        @wine.valid?
        expect(@wine.errors[:region_id]).to include("ワインの生産地を選択してください")
      end
    end
  end
end
