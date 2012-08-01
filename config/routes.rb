BlogOf7li::Application.routes.draw do
  resources :microposts

  get "myzone/notice"

  devise_for :users

  resources :blogs do
    resources :comments, :only => [:create, :destroy]
  end

  resources :notices
  resources :readers, :only => [:create, :destroy]

  match "/blogs/tag/:tag" => "blogs#tag", :as => "tagged_blogs", :via => :get
  match "/myzone/notice" => "myzone#notice",
        :as => "myzone_notice", :via => :get

  root :to => "blogs#index"
  match "/about" => "home#about", :as => "about", :via => :get
end
