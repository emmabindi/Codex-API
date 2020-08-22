class AnalyticsController < ApplicationController
  before_action :authenticate_user

  # get '/analytics/activity', to: 'analytics#entries_by_date'
  def entries_by_date
    render json: {
      total_entries_by_date: current_user.fetch_activities_by_date(:bookmarks, :goals, :journals),
      bookmarks: current_user.fetch_activity_by_date(:bookmarks),
      goals: current_user.fetch_activity_by_date(:goals),
      journals: current_user.fetch_activity_by_date(:journals)
    }
  end

  #   get '/analytics/categories', to: 'analytics#categories'
  def categories
    render json: {
      total_entries_by_category: current_user.fetch_activities_by_category(:bookmarks, :goals, :journals),
      bookmarks_by_category: current_user.fetch_activity_by_category(:bookmarks),
      goals_by_category: current_user.fetch_activity_by_category(:goals),
      journals_by_category: current_user.fetch_activity_by_category(:journals)
    }
  end

  #   get '/analytics/languages', to: 'analytics#languages'
  def languages
    render json: {
      total_entries_by_language: current_user.fetch_activities_by_language(:bookmarks, :goals, :journals),
      bookmarks_by_language: current_user.fetch_activity_by_language(:bookmarks),
      goals_by_language: current_user.fetch_activity_by_language(:goals),
      journals_by_language: current_user.fetch_activity_by_language(:journals)
    }
  end

  def counts
    # Activity by week
    # weekly_activity = bookmark_week_count + goals_week_count + journals_week_count

    render json: {
      bookmarks_total: current_user.bookmarks.length,
      journals_total: current_user.journals.length,
      completed_goals: current_user.goals.where(completed: true).length,
      active_goals: current_user.goals.where(completed: false).length,

      # Activity by Day
      bookmark_daily_count: current_user.fetch_daily_counts(:bookmarks),
      journals_daily_count: current_user.fetch_daily_counts(:journals),
      goals_daily_count: current_user.fetch_daily_counts(:goals),

      # won't work because need to total these before sending as json
      # daily_activity: (bookmark_daily_count + goals_daily_count + journals_daily_count),

      # Activity by week
      bookmark_week_count: current_user.fetch_weekly_counts(:bookmarks),
      journals_week_count: current_user.fetch_weekly_counts(:journals),
      goals_week_count: current_user.fetch_weekly_counts(:goals)
      # weekly_activity: weekly_activity
    }
  end
end
