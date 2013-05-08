# -*- encoding : utf-8 -*-
Techplatform::Application.routes.draw do

  match 'apis/weekly_journals/index' => "weekly_journals#index"

  resources :code_reviews

  resources :journals, :only => [:new, :create, :destroy, :index] do
    collection do
      get :receiver_list
    end
  end

  resources :announcements, :except => [:show]
  match 'announcements/:id/hide', to: 'announcements#hide'
  match 'statistics', to: 'statistics#index'
  root :to => 'home#index'
  match 'logout' => "users#logout"

  resources :weekly_journals do
    member do
      post :vote
    end
  end
  resources :comments, :only => [:create, :destroy, :index]

  match 'weekly_journals/:week' => 'weekly_journals#index'

  resources :positive_energies, :except => [:show]

  resources :posts, :only => [:index]
  resources :users, :only => [:show, :update]

  resources :upload_files, :only => [:create, :destroy, :index]

  resources :user_actions, :only => [:update, :destroy, :index] do
    collection do
      post 'refresh'
    end
  end

  resources :action_roles, :only => [:index] do
    collection do
      post 'toggle'
    end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  #match ':controller(/:action(/:id))(.:format)'
end
