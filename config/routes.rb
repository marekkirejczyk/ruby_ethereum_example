Rails.application.routes.draw do

  resources :greeters do
    collection do
      get 'status'
    end
  end

  root to: "greeters#new"
end
