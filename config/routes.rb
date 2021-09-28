Rails.application.routes.draw do
  #root "articles#index"
  resources :articles,only: [:index, :show, :create, :update, :destroy] #do

    #resources :comments

  #end
  resources :comments,only: [:index, :show, :create, :update, :destroy]

  resources :users,param: :id
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
