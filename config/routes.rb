Rails.application.routes.draw do

  root 'user#index'

  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/auth/spotify/callback', to: 'sessions#create'

  get 'parties/index' => 'parties#index'

  resources :songs
  resources :user

  # get 'parties/new'
  get 'joinparty' => 'parties#join_party', as: 'joinparty'

  resources :parties

  post 'parties/delete' => 'parties#delete'
 
  # resources :parties, except: [:show] do
  #   collection do
  #     get 'invitation/:code' => 'parties#show', as: "invitation"
  #   end
  # end
  # get 'invitation/:code' => 'parties#show', as: "invitation"

  get '/:code' => 'parties#show', as: 'playlist'

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
