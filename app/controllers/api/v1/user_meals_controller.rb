class Api::V1::UserMealsController < ApplicationController

    def index
        @user_meals = UserMeal.all
        render json: @user_meals
    end

    def show
        @user_meals = UserMeal.find(params[:id])
        render json: @user_meals
    end
    

    def create
        @user_meals = UserMeal.create(user_meals_params)
        render json: @user_meals
        # if @user_meals.valid?
        #   flash[:success] = "Object successfully created"
          
        # else
        #   flash
        #   [:error] = "Something went wrong"
        # end
    end
    
    private 

    def user_meals_params
        params.require(:user_meal).permit(:meal_id, :user_id, :favorite)
    end


end
