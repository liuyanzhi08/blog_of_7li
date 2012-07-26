BlogOf7li::Application.routes.draw do
  devise_for :users

  resources :blogs do
    member do
      get :addTag
    end
  end

  root :to => "home#welcome"
end
