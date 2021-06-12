Rails.application.routes.draw do

  root to: 'posts#index'

  resources :posts do
    member do
      put 'like', to: 'posts#like'
    end
  end

  scope :profile, as: :profile do
    get 'edit', to: 'profile#edit'
    put 'update', to: 'profile#update'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
