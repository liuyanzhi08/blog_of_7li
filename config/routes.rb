BlogOf7li::Application.routes.draw do
  devise_for :users
  resources :blogs do
    resources :comments, :only => [:create, :destroy]
  end

  match "/blogs/tag/:tag" => "blogs#tag", :as => "tagged_blogs", :via => :get

  root :to => "blogs#index"
  match "/about" => "home#about", :as => "about", :via => :get
end
