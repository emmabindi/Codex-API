class TimerController < ApplicationController
  before_action :authenticate_user

  def index
    time_length = current_user.timers.all.sum(:time_length)
    render json: {
      time_length: time_length
    }
  end

  def update; end
end
