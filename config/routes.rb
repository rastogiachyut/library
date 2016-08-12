Rails.application.routes.draw do

  namespace :admin do
    resources :books
    resources :inventory_items
  end

  resources :users, only: [:create, :new] do
    resources :loaned_items
    # resources :orders, only: [:delete, :show, :index] do
    #   member do
    #     post :place
    #   end
    #   resources :line_items, only: [:create, :delete, :show, :index]
    # end
  end

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
