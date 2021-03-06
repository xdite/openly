# -*- encoding : utf-8 -*-
Openly::Application.routes.draw do
  devise_for :users

  resources :gazettes do |gazette|
    resources :verbal_questions
  end

  namespace :admin do
    resources :gazettes do |gazette|
      resources :verbal_questions
    end
  end
  resources :elections
  resources :committees

  match '/search' => "search#index", :as => "search"

  root :to => "elections#index"

end
