# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require_relative '../config/environment'
require 'json'

User.destroy_all
Meal.destroy_all

meals_array = []
mealsId_array = []

2.times do 
    meals = RestClient.get('https://www.themealdb.com/api/json/v1/1/random.php')
    data = JSON.parse(meals)
    if(mealsId_array.include?(data["meals"][0]["idMeal"]) == false)
        meals_array.push(data)
    end
    mealsId_array.push(data["meals"][0]["idMeal"])
end

meals_array.each do |meal| 
    byebug
    Meal.create(
        name: meal["meals"][0]["strMeal"],
        image: meal["meals"][0]["strMealThumb"],
        category: meal["meals"][0]["strCategory"],
        origin: meal["meals"][0]["strArea"],
        youtube_link: meal["meals"][0]["strYoutube"]
    )
end
