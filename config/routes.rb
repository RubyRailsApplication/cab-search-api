Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :travellers, only: [:index,:create,:show]
    end
  end
  namespace :api do
    namespace :v1 do
      resources :drivers, only: [:index,:create,:show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'api/v1/driver/register', to: 'api/v1/drivers#create'
  post 'api/v1/driver/:id/sendLocation', to: 'api/v1/drivers#saveLocation'
  post 'api/v1/passenger/available_cabs', to: 'api/v1/travellers#create'
end
