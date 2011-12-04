module Application
  Router = SimpleRackFramework::SimpleRouter.new do
  	root_to :posts

  	get "sign-out" => "sessions#destroy", :as => "signout" #path=>/sessions/signout
    get "sign-in" => "sessions#new", :as => "signin" #path=>/sessions/new
    get "sign-up" => "users#new", :as => "signup"

  	resources :users
  	resources :sessions
  	resources :posts
  end
end

