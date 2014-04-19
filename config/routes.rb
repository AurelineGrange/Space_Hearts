SpaceHearts::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  root 'static_pages#home'

  match '/signout',           to: 'sessions#destroy',               via: 'delete'
  match '/about',             to: 'static_pages#about',             via: 'get'
  match '/help',              to: 'static_pages#help',              via: 'get'
  match '/terms',             to: 'static_pages#terms',             via: 'get'
  match '/contact',           to: 'static_pages#contact',           via: 'get'
  match '/signup',            to: 'users#new',                      via: 'get'
  match '/signin',            to: 'sessions#new',                   via: 'get'

  match '/secret',            to: 'static_pages#search_with_secret_key',    via: 'post'
  match '/secret/:secret_key',to: 'microposts#display',             via: 'get'

  match '/choice',            to: 'static_pages#choice',            via: 'get'
  match '/vip',               to: 'static_pages#vip',               via: 'get'

  match '/love_letter',       to: 'microposts#new',                 via: 'get'
  match '/configure',         to: 'microposts#chose_web_only',      via: 'get'
  match '/ready_to_launch',   to: 'microposts#finalize_order',      via: 'get'
  match '/check_finalize',    to: 'microposts#check_finalize',      via: 'patch'
  match '/last_step',         to: 'microposts#payment',             via: 'get'


  match '/heart_wall_xml',    to: 'microposts#heart_wall_xml',      via: 'get'
  match '/create_heart_auto', to: 'microposts#create_heart_auto',   via: 'get'
  match '/pay_heart_auto',    to: 'microposts#pay_heart_auto',      via: 'patch'
  match '/check_secret_key',  to: 'microposts#check_secret_key',  via: 'get' 



  match '/maintenance',       to: 'errors#maintenance',             via: 'get'
  match '/admin_pannel_users',to: 'users#admin_pannel_users',       via: 'get'
  match '/admin_users_actions',to: 'users#admin_users_actions',     via: 'get'
  match '/admin_pannel_posts',to: 'microposts#admin_pannel_posts',  via: 'get'
  match '/admin_post_actions',to: 'microposts#admin_post_actions',  via: 'get'
  match '/admin_sort_posts',  to: 'microposts#admin_sort_posts',    via: 'get'


  #match '/404',     to: 'errors#404',   via: 'get'
  #match '/422',     to: 'errors#422',   via: 'get'
  #match '/500',     to: 'errors#500',   via: 'get'

  #%w( 404 422 500).each do |code|
   # get code, :to => "errors#show", :code => code
  #end

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


  #Last route in routes.rb
  match '*a', :to => 'errors#show', via: 'get'

end
