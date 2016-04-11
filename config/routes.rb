Rails.application.routes.draw do
   resources :users, :only => [:new,:create]
   resources :contacts, :only => [:index, :show]

   root :to => "users#new"
end
