BlogOf7li::Application.routes.draw do
  devise_for :users, :except => "sessions#new"

  resources :blogs do
  end

  match "/blogs/tag/:tag" => "blogs#tag", :as => "tagged_blogs", :via => :get

  root :to => "home#welcome"
end
