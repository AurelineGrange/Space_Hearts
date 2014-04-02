SpaceHearts::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  root 'static_pages#home'

  match '/signout',         to: 'sessions#destroy',           via: 'delete'
  match '/about',           to: 'static_pages#about',         via: 'get'
  match '/help',            to: 'static_pages#help',          via: 'get'
  match '/contact',         to: 'static_pages#contact',       via: 'get'
  match '/pricing',         to: 'static_pages#pricing',       via: 'get'
  match '/signup',          to: 'users#new',                  via: 'get'
  match '/signin',          to: 'sessions#new',               via: 'get'

  match '/secret',   to: 'static_pages#search_with_secret_key',    via: 'post'
  match '/secret/:secret_key',   to: 'microposts#display',       via: 'get'


  match '/choice',          to: 'static_pages#choice',        via: 'get'
  match '/vip',             to: 'static_pages#vip',           via: 'get'

  match '/love_letter',     to: 'microposts#new',             via: 'get'
  match '/configure',       to: 'microposts#chose_web_only',  via: 'get'
  match '/ready_to_launch', to: 'microposts#finalize_order',  via: 'get'
  match '/check_finalize',  to: 'microposts#check_finalize',  via: 'patch'
  match '/last_step',       to: 'microposts#payment',         via: 'get'

  #match '/ready_to_launch', to: 'microposts#finalize_order',  via: 'patch'




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
