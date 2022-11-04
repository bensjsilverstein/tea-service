Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'subscribe', to: 'customers/subscriptions#create'
      patch 'subscriptions/cancel', to: 'customers/subscriptions#update'
      get 'customer/subscriptions', to: 'customers/subscriptions#index'
    end
  end
end
