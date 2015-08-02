Rails.application.routes.draw do
  root 'sessions#new'

  get '/new_company' => 'sessions#new_company'
  get '/new_session_tailor' => 'sessions#new_session_tailor'

  post '/new_company' => 'sessions#new_company'
  post '/new_session_tailor' => 'sessions#new__sessiosn_tailor'

        # get '/create_company_session' => 'sessions#create_company_session'
        # get '/create_tailor_session' => 'sessions#create_tailor_session'
        # post '/create_company_session' => 'sessions#create_company_session'
        # post '/create_tailor_session' => 'sessions#create_tailor_session'

  resources :sessions
  resource :companies do
    resources :tailors
  end

  resources :tailors
  resources :appointments

        # get '/signup' => 'users#new'
        # post '/users' => 'users#create'
        # get '/profile' => 'users#show'
  get '/session' => 'sessions#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
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
