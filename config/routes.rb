Rails.application.routes.draw do
  devise_for :skaters
  
  namespace :api do
    resources :posts, except: [:new, :edit]
    resource :skater_profile, except: [:index]
  end
end
