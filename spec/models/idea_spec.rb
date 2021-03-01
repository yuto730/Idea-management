require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe 'アイデア新規登録' do
    before do
      @idea = FactoryBot.build(:idea)
    end

    context '新規登録できる場合' do
      it 'category_idとbodyが存在すれば登録できる' do
        expect(@idea).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'bodyが空では投稿できない' do
        @idea.body = ''
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Body can't be blank")
      end
      it "categoryが紐付いていないと登録できない" do
        @idea.category_id = ''
        @idea.valid?
        expect(@idea.errors.full_messages).to include("Category can't be blank")
      end
    end
  end
end
