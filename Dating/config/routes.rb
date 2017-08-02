Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users do
    resources :comments, :defaults => {:commentable => 'User'}

  end
  resources :questions do
    resources :comments, :defaults => {:commentable => 'Question'}
  end

  resources :answers

  resources :likes

end
