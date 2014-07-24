Rails.application.routes.draw do

  root 'user#index'

  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'playlist/show' => 'playlist#show'

  get '/auth/spotify/callback', to: 'sessions#create'

  get 'songs/index'

  get 'songs/create'

  get 'songs/show'

  get 'songs/update'

  get 'songs/delete'

  get 'party/index'

  get 'party/create'

  get 'party/show'

  get 'party/update'

  get 'party/delete'

  get 'playlists/index'

  get 'playlists/create'

  post 'playlists/show' => 'playlists#show'
  get 'playlists/show' => 'playlists#show'
  get 'playlists/:party_code' => 'playlists#show'

  get 'playlists/update'

  get 'playlists/delete'

  get 'user/index'

  get 'user/create'

  get 'user/show'

  get 'user/delete'

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
  #   namespace :user do
  #     # Directs /user/products/* to user::ProductsController
  #     # (app/controllers/user/products_controller.rb)
  #     resources :products
  #   end
end
