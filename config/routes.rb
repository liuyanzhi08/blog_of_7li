BlogOf7li::Application.routes.draw do
  devise_for :users

  resources :blogs do
  end

  match "/blogs/tag/:tag" => "blogs#tag", :as => "tagged_blogs"

  root :to => "home#welcome"
end
