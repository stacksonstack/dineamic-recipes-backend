class Api::V1::UsersController < ApplicationController
    
    def index
        @user = User.all
        render json: @user
    end

    def show
        @user = User.find(params[:id])
        render json: @user, serializer: UserSerializer
    end
    

    def create
        @user = User.create(user_params)
        render json: @user
        # if @user.valid?
        #   flash[:success] = "Object successfully created"
        # else
        #   flash
        #   [:error] = "Something went wrong"
        # end
    end
    
    private 

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
