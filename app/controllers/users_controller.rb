class UsersController < ApplicationController
  def create
    User.create(user_params)
    render json: "user created", status: 200
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
