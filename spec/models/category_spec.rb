require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'カテゴリー新規登録' do
    before do
      @category = FactoryBot.build(:category)
    end

    context '新規登録できる場合' do
      it 'nameが存在すれば登録できる' do
        expect(@category).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nameが空では登録できない' do
        @category.name = ''
        @category.valid?
        expect(@category.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
