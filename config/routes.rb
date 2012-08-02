BlogOf7li::Application.routes.draw do

  resources :microposts

  devise_for :users

  resources :blogs do
    resources :comments, :only => [:create, :destroy]
  end

  resources :notices
  resources :readers, :only => [:create, :destroy]

  match "/blogs/tag/:tag" => "blogs#tag", :as => "tagged_blogs", :via => :get

  root :to => "blogs#index"
  match "/about" => "home#about", :as => "about", :via => :get

  match "/archive" => "archive#index", :via => :get
  match "/archive/search" => "archive#search", :via => :post
end
