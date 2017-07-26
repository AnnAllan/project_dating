Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users do
    resources :comments
    resources :likes

  end
  resources :questions do
    resources :comments
  end

end
