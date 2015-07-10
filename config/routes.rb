Rails.application.routes.draw do
  
  devise_for :users
  root :to => 'skills#index'
  resources :skills do
  	collection do 
  		get 'all'
  	end
    resources :projects, :except => [:index]
  end  
  
  resources :posts
end


