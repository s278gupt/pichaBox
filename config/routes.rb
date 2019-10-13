Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  
  root to: 'home#index'

  resources :albums do
    member do
      delete :delete_image_attachment
    end
   end
end