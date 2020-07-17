class UsersController < ApplicationController
  before_action :authenticate_user

  def index
    if params[:type] == "json"
      render json: {
        user: {
          id: current_user.id
          username: current_user.username,
          email: current_user.email
        }
      }
    end
  end

  def create
    User.create(user_params)
    render json: "user created", status: 201
  end

  def destroy
    # // check auth first??
    # @user = User.find(params[:id])
    # @user.destroy
   current_user.destroy
    # delete all dependent info?? models dependent :destroy ?? 
    render json: "User Deleted", status: 200
  end 

  private 

  def user_params 
    params.require(:user).permit(:email, :password)
  end 
end
