class User < ApplicationRecord
    has_many :meals, through: :user_meals
    has_many :user_meals
end
