require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.create(:review) # ここで基本的なレビューインスタンスを作成
  end

  describe 'レビュー投稿のテスト' do
    context '正常系' do
      it '必要な属性が全て有効である場合' do
        expect(@review).to be_valid
      end

      it '感想が空でも有効である' do
        @review.content = ''
        expect(@review).to be_valid
      end

      it '評価の詳細が全て空でも有効である' do
        @review.sweetness = nil
        @review.bitterness = nil
        @review.acidity = nil
        @review.alcohol = nil
        expect(@review).to be_valid
      end

      it '画像が添付されていなくても有効である' do
        @review.image.purge
        expect(@review).to be_valid
      end

      it 'ワインの飲んだ日付が空でも有効である' do
        @review.wine_date = nil
        expect(@review).to be_valid
      end

      it '飲んだ場所が空でも有効である' do
        @review.wine_bar = ''
        expect(@review).to be_valid
      end

      it '香りの記録がなくても有効である' do
        @review.fragrances = []
        expect(@review).to be_valid
      end
    end

    context '異常系' do
      it 'ユーザーが関連付けられていない場合は無効である' do
        @review.user = nil
        @review.valid?
        expect(@review.errors[:user]).to include('を入力してください')
      end

      it 'ワインが関連付けられていない場合は無効である' do
        @review.wine = nil
        @review.valid?
        expect(@review.errors[:wine]).to include('を入力してください')
      end
    end
  end
end
