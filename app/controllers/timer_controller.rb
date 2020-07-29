class TimerController < ApplicationController
  before_action :authenticate_user

  def index
    time_length = current_user.timers.all.sum(:time_length)
    render json: {
      time_length: time_length
    }
  end

  def create
    timer = current_user.timers.create(timer_params)
    if timer.save
      render json: timer, status: :created
    else
      render json: { errors: timer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def timer_params
    params.require(:timer).permit(
      :time_length
    )
  end
end
