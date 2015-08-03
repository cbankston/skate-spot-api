Rails.application.routes.draw do
  devise_for :skaters
  
  namespace :api do
    resources :posts, except: [:new, :edit]
    resource :skater_profile, except: [:index]
    resources :spots, only: [:index, :create]
    resources :post_votes, only: [:create]
  end
end
