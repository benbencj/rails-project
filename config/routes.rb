Rails.application.routes.draw do
  resources :carts

  resources :categories

  resources :products

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'homepage/index'
  get '/products/index'
  get '/websiteinfo/1' => 'websiteinfo#contact'
  get '/websiteinfo/2' => 'websiteinfo#about'
  get '/categories/index'
  get '/filter/index'
  get '/filter/on_sale'
  get '/filter/new'
  get '/filter/updated'
  
  get '/categories/1' => 'categories#show', as: 'cate_frame'
  get '/categories/2' => 'categories#show', as: 'cate_sofa'
  get '/categories/3' => 'categories#show', as: 'cate_chairs'
  get '/categories/4' => 'categories#show', as: 'cate_tables'
  get '/categories/5' => 'categories#show', as: 'cate_mattress'
  
  
  get 'search' => 'products#search', as: 'search'
  get 'search_results' => 'products#search_results', as: 'search_results'
  
  post '/add_product_to_cart/:id' => 'products#add_product_to_cart', as: 'add_to_cart'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'homepage#index'

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
