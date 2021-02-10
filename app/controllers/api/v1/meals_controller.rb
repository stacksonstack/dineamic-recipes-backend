class Api::V1::MealsController < ApplicationController

    def index
        @meal = Meal.all
        render json: @meal
    end

    def show
        @meal = Meal.find(params[:id])
        render json: @meal
    end
    
    def create
        @meal = Meal.create(meal_params)
        render json: @meal
    end
    
    private 
    def meal_params
        params.require(:meal).permit(:name, :image, :category, :origin, :youtube_link, :instructions, :measurement => [], :ingredient => [])
    end  
end
