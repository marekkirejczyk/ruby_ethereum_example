Rails.application.routes.draw do
  resources :greeters

  root to: "greeters#index"
end
