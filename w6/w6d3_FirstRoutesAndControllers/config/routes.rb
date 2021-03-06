Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users 
  patch 'users/:id', to:'user#update'
  # get 'users/:id', to: 'users#show', as: 'user'

  # why is it that when we use post our nested parameters, 
  # we cant have /users/2 as a path?
  # we can get nested parameters from users2?

  # how is a nested parameter useful?
  # we know that it allows information to be stored in one object
  # narrow the scope in which someone can hijack informations
  # in params, this is the only information i want
  # i will only allow these values or keys to exist
  # we have to always require(key) and permit(value) to belong to key
end
