class Meal < ApplicationRecord
    has_many :users, through: :user_meals
    has_many :user_meals
end
