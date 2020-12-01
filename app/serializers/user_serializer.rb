class UserSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
  
    attributes :id, :name, :email, :password
    has_many :user_meals
    has_many :meals, through: :user_meals
  
end