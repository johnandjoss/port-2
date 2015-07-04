Rails.application.routes.draw do
  
  root :to => 'skills#index'
  resources :skills do
  	collection do 
  		get 'all'
  	end
    resources :projects, :except => [:index]
  end  
  
end


