Rails.application.routes.draw do
  namespace 'api', format: 'json' do
    namespace 'v1' do
      resources :categories, only: %i[index show create]
      resources :ideas, only: %i[index show create]
    end
  end
end
