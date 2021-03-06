Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  match '/about', to: "static_pages#about", via: [:get]
  match '/map', to: "static_pages#map", via: [:get]
  match '/workshops', to: "static_pages#workshops", via: [:get]
  match '/locations', to: "static_pages#locations", via: [:get]
  match '/calendar', to: "static_pages#calendar", via: [:get]
  match '/become_a_hero', to: "static_pages#become_a_hero", via: [:get]

  match '/profile/:id', to: "profiles#show", via: [:get]


  resources :locations, only: [:show]
  resources :workshops, only: [:show, :new, :create, :update, :edit]
  resources :workshop_dates, only: [:new, :create, :update, :edit]

  namespace :admin do
    resources :users
    resources :regions
    resources :locations
    resources :workshops
    resources :workshop_dates
    root "dashboard#index"
  end

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
