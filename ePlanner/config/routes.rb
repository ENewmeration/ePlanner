Rails.application.routes.draw do
  root 'application#show'

  namespace :teacher do
    get 'signup'         => 'sessions#signup'
    get 'login'          => 'sessions#login'
    resources :users do
      get '/courses/remove' => 'courses#remove', as: :remove_course
      get '/courses/change' => 'courses#change', as: :edit_course
      get '/courses/update' => 'courses#update_course', as: :update_course
      #get 'users/:id', to: 'courses#index', as: :user 
      resources :courses
    end
  end

  namespace :student do
    get 'signup'         => 'sessions#signup'
    get 'login'          => 'sessions#login'
    resources :users do
      resources :courses
    end
  end
  
end
