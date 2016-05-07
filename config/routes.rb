Rails.application.routes.draw do


  root "main#index"

  get '/login' => 'user_sessions#new'
  post '/login' => 'user_sessions#create'
  get '/logout' => 'user_sessions#destroy'

  get '/signup' => 'user#new'
  post '/users' => 'user#create'

  get '/properties/update' => 'properties#update'
  get '/properties/destroy' => 'properties#destroy'
  get '/properties/delete' => 'properties#delete'
  get '/properties/edit' => 'properties#edit'
  get '/properties/show' => 'properties#show'
  get '/properties/create' => 'properties#create'
  get '/properties/index' => 'properties#index'
  get '/properties/new' => 'properties#new'
  get '/properties/show_all' => 'properties#show_all'

  get '/user/update' => 'user#update'  
  get '/user/show' => 'user#show'  
  get '/user/create' => 'user#create'  
  get '/user/index' => 'user#index'
  get '/user/edit' => 'user#edit'

  get '/main/browse' => 'main#browse'
  get '/main/show' => 'main#show'
  get '/main/signup' => 'main#signup'
  get '/main/login' => 'main#login'
  get '/main/logout' => 'main#logout'
  get '/main/attempt_login' => 'main#attempt_login'
  post '/main/attempt_login' => 'main#attempt_login'

  post '/user/create' => 'user#create'
  post '/user/update' => 'user#update'
  post '/properties/create' => 'properties#create'
  post '/properties/destroy' => 'properties#destroy'
  post '/properties/update' => 'properties#update'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
