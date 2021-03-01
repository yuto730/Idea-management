require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    before do
      FactoryBot.create_list(:category, 10)
    end

    it '全てのcategoryを取得する' do
      get '/api/v1/categories'
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # 正しい数のデータが返されたか確認する。
      expect(json['data'].length).to eq(10)
    end
  end

  describe 'POST /categories' do
    it '新しいcategoryを作成する' do
      valid_params = { name: 'name' }

      # データが作成されている事を確認
      expect { post '/api/v1/categories', params: valid_params }.to change(Category, :count).by(1)

      # リクエスト成功を表す201が返ってきたか確認する。
      expect(response.status).to eq(201)
    end
  end

  describe 'GET /categories/category_name' do
    before do
      @category = FactoryBot.create(:category)
    end

    it '特定のcategoryを取得する' do
      get "/api/v1/categories/#{@category.name}"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # 要求した特定のカテゴリーのみ取得した事を確認する
      expect(json['data'][0]['name']).to eq(@category.name)
    end
  end
end
