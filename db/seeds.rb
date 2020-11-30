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

150.times do 
    meals = RestClient.get('https://www.themealdb.com/api/json/v1/1/random.php')
    data = JSON.parse(meals)
    if(mealsId_array.include?(data["meals"][0]["idMeal"]) == false)
        meals_array.push(data)
    end
    mealsId_array.push(data["meals"][0]["idMeal"])
end

def ingredient_to_array(meal)
    ingredients_array = []
    counter = 1
    while counter <= 20
        ingredients_array.push(meal["meals"][0]["strIngredient#{counter}"])
        counter += 1
    end
    ingredients_array.reject(&:blank?)
end

def measurement_to_array(meal)
    measurements_array = []
    counter = 1
    while counter <= 20
        measurements_array.push(meal["meals"][0]["strMeasure#{counter}"])
        counter += 1
    end
    measurements_array.reject(&:blank?)
end

meals_array.each do |meal|
    Meal.create(
        name: meal["meals"][0]["strMeal"],
        image: meal["meals"][0]["strMealThumb"],
        category: meal["meals"][0]["strCategory"],
        origin: meal["meals"][0]["strArea"],
        youtube_link: meal["meals"][0]["strYoutube"],
        instructions: meal["meals"][0]["strInstructions"],
        ingredient: ingredient_to_array(meal),
        measurement: measurement_to_array(meal)
    )
end

User.create(
    name: "user",
    email: "user@gmail.com",
    password: "1234"
)