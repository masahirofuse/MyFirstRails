Rails.application.routes.draw do
  root 'questions#index'
  resources :questions do
    resources :comments, :only => [:edi, :create, :update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
