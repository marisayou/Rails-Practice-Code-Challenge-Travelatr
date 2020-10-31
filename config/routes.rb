Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:show, :new, :create]
  resources :posts
  resources :destinations, only: [:show]

  post '/posts/:id', to: 'posts#like', as: 'like'
end
