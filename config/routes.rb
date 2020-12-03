Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do
      resources :users
      resources :meals
      resources :user_meals, except: :destroy
      delete 'users/:user_id/user_meals/:meal_id', :to => 'user_meals#destroy'
    end
  end

end
