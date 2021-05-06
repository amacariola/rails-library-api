Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :authors, only: %i[index show] do
       resources :books 
      end
      resources :books
      get '/search/:text', to: 'search#index'
    end
  end
end
