class TimerController < ApplicationController
  def index
    time_length = current_user.timer.time_length
    render json: {
      time_length: time_length
    }
  end

  def update; end
end
