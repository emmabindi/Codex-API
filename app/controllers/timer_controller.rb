class TimerController < ApplicationController
  def index
    time_length = current_user.timers.first.time_length
    # time_length = 1
    render json: {
      time_length: time_length
    }
  end

  # def update
    # current_user.timers.first.time_length{insert variable here that adding (amount received from front end)}
  # end
end
