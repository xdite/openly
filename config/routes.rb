# -*- encoding : utf-8 -*-
Openly::Application.routes.draw do
  devise_for :users

  resources :gazettes
  resources :elections
  resources :committees
  
  root :to => "elections#index"

end
