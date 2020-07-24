class UsersController < ApplicationController
  before_action :authenticate_user

  def index
    if params[:type] == 'json'
      render json: {
        user: {
          id: current_user.id,
          username: current_user.username,
          email: current_user.email
        }
      }
    end
  end

  def create
    User.create(user_params)
    render json: 'user created', status: :created
  end

  def destroy
    current_user.destroy
    render json: 'User Deleted', status: :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
