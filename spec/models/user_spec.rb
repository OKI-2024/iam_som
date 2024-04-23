# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '全ての属性が有効な場合' do
      it 'ユーザー登録ができる' do
        expect(@user).to be_valid
      end
    end

    context 'ニックネームが無効な場合' do
      it 'ニックネームが空だと無効' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors[:nickname]).to include('を入力してください')
      end

      it 'ニックネームが10文字を超えると無効' do
        @user.nickname = 'a' * 11
        @user.valid?
        expect(@user.errors[:nickname]).to include('は最大10文字までです')
      end
    end

    context 'メールアドレスが無効な場合' do
      it 'メールアドレスが空だと無効' do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include('を入力してください')
      end

      it '既に存在するメールアドレスだと無効' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors[:email]).to include('は既に存在しています')
      end
    end

    context 'パスワードが無効な場合' do
      it 'パスワードが空だと無効' do
        @user.password = nil
        @user.valid?
        expect(@user.errors[:password]).to include('を入力してください')
      end
    end

    context '自己紹介が無効な場合' do
      it '自己紹介が241文字だと無効' do
        @user.introduction = 'a' * 241
        @user.valid?
        expect(@user.errors[:introduction]).to include('は最大240文字までです')
      end
    end

    context '自己紹介が空の場合' do
      it '空でも有効' do
        @user.introduction = ''
        expect(@user).to be_valid
      end
    end
  end
end
