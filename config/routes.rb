BlogOf7li::Application.routes.draw do
  resources :blogs do
    member do
      get :addTag
    end
  end

  root :to => "home#welcome"
end
