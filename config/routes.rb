Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do
      resources :users
      resources :meals
      resources :user_meals
      get 'users/:id/user_meals' => "user_meals#filter_by_user"
    end
  end

end
