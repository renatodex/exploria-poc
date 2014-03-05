Exploria::Application.routes.draw do
  get "merchant/:merchant_id/store" => "merchant#store", :as => 'merchant'
  get "merchant/:merchant_id/buy_items" => "merchant#buy_items", :as => 'merchant_buy'
  get "merchant/:merchant_id/sell_items" => "merchant#sell_items", :as => 'merchant_sell'

  get "merchant/:merchant_id/buy_transaction/:item_id" => "merchant#buy_transaction", :as => 'merchant_buy_transaction'
  get "merchant/:merchant_id/sell_transaction/:hero_item_id" => "merchant#sell_transaction", :as => 'merchant_sell_transaction'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  get "game/scene" => "game#scene", :as => "scene"
	get "game/battle_scene" => "game#battle_scene", :as => "battle_scene"
	get "game/take_action/:action_id" => "game#take_action", :as => "take_action"
	get "game/battle/actions/physical-attack" => "game#battle_physical_attack", :as => "battle_physical_attack"
	get "game/battle/gameover" => "game#battle_gameover", :as => "battle_gameover"
	get "game/battle/victory" => "game#battle_victory", :as => "battle_victory"
	get "game/actions/use_item/:hero_item_id" => "game#use_item", :as => "use_item"
	get "game/actions/unequip_item/:hero_item_id" => "game#unequip_item", :as => "unequip_item"

	mount HeroAPI => '/'

  resources :monster_instances

  resources :monsters

  resources :items

  resources :heros

  resources :npcs

  resources :scene_nodes

  resources :scene_actions

  resources :scenes

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
