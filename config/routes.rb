Rails.application.routes.draw do
  root 'sessions#new'

  get '/new_company' => 'sessions#new_company'
  get '/new_session_tailor' => 'sessions#new_session_tailor'
  get '/new_session_user' => 'sessions#new_session_user'

  get '/dashboard' => 'users#dashboard'

  post 'sessions/login_user'
  post 'sessions/login_company'
  post 'sessions/login_tailor'

  delete '/logout_company' => 'sessions#logout_company'
  delete '/logout_user' => 'sessions#logout_user'
  delete '/logout_tailor' => 'sessions#logout_tailor'


  resources :sessions
  resource :companies do
    resources :tailors
  end

  resources :tailors do
    resources :appointments
    resources :availabilities
  end

  resources :users do
    resources :appointments
  end

  resources :appointments do
    resources :articles
  end



  resources :articles
        # get '/signup' => 'users#new'
        # post '/users' => 'users#create'
        # get '/profile' => 'users#show'









        # get '/signup' => 'users#new'
        # post '/users' => 'users#create'
        # get '/profile' => 'users#show'

  get '/session' => 'sessions#show'
  get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'

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
