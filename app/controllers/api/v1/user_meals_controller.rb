class Api::V1::UserMealsController < ApplicationController

    before_action :find_user_meal, except: [:index, :create, :destroy]

    def index
        @user_meals = UserMeal.all
        render json: @user_meals
    end

    def show
        render json: @user_meal
    end

    def update
        @user_meal.update(user_meals_params)
        render json: @user_meal
    end
    
    def create
        user_meal = UserMeal.create(user_meals_params)
        render json: user_meal
        # if @user_meals.valid?
        #   flash[:success] = "Object successfully created"
          
        # else
        #   flash
        #   [:error] = "Something went wrong"
        # end
    end

    def destroy
        user_meal = UserMeal.find_by(user_id: params[:user_id], meal_id: params[:meal_id])
        user_meal.destroy

        user_meals = User.find(params[:user_id]).meals
        render json: user_meals
    end
    
    private

    def find_user_meal
        @user_meal = UserMeal.find(params[:id])
    end

    def user_meals_params
        params.require(:user_meal).permit(:meal_id, :user_id, :favorite)
    end


end
