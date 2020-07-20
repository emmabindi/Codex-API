class AnalyticsController < ApplicationController
  before_action :authenticate_user

  def index
    bookmarks_total = current_user.bookmarks.length
    journals_total = current_user.journals.length    
    completed_goals = Goal.where(completed: true).length
    active_goals = Goal.where(completed: false).length

    render json: { bookmarks_total: bookmarks_total, journals_total: journals_total, completed_goals: completed_goals, active_goals: active_goals}
  end
end

