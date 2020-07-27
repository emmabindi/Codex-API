class UsersController < ApplicationController
  before_action :authenticate_user, only: [:update]

  def index
    render json: {
      user: {
        id: current_user.id,
        username: current_user.username,
        email: current_user.email
      }
    }
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: 'user created', status: :ok
    else 
      render json: user.errors.full_messages
    end
  end

  def destroy
    current_user.delete
    render json: 'User Deleted', status: :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
