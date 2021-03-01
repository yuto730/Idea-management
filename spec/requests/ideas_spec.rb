require 'rails_helper'

RSpec.describe 'Ideas', type: :request do
  describe 'GET /ideas' do
    before do
      FactoryBot.create_list(:idea, 10)
    end

    it '全てのideaを取得する' do
      get '/api/v1/ideas'
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # 正しい数のデータが返されたか確認する。
      expect(json['data'].length).to eq(10)
    end
  end

  describe 'POST /ideas' do
    it '新しいideaを作成する' do
      category = FactoryBot.create(:category)
      valid_params = { category_id: category.id, body: 'text' }

      # データが作成されている事を確認
      expect { post '/api/v1/ideas', params: valid_params }.to change(Idea, :count).by(1)

      # リクエスト成功を表す201が返ってきたか確認する。
      expect(response.status).to eq(201)
    end
  end

  describe 'GET /ideas/category_name' do
    before do
      category = FactoryBot.create(:category)
      @idea = FactoryBot.create(:idea, category: category)
    end

    it '特定のideaを取得する' do
      get "/api/v1/ideas/#{@idea.category.name}"
      json = JSON.parse(response.body)

      # リクエスト成功を表す200が返ってきたか確認する。
      expect(response.status).to eq(200)

      # 要求した特定のカテゴリーのみ取得した事を確認する
      expect(json['data'][0]['category']).to eq(@idea.category.name)
    end
  end
end
