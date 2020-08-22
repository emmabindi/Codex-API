class AnalyticsController < ApplicationController
  before_action :authenticate_user

  # get '/analytics/activity', to: 'analytics#entries_by_date'
  def entries_by_date
    render json: {
      total_entries_by_date: current_user.fetch_activities_by_date(:bookmarks, :goals, :journals),
      bookmarks: current_user.fetch_activity_by_date(:bookmarks),
      goals: current_user.fetch_activity_by_date(:goals),
      journals: current_user.fetch_activity_by_date(:journals),
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
    def fetch_activity_by_language(type)
      current_user.public_send(type).joins(:language).group(:name).count(:name)
    end

    @bookmarks = fetch_activity_by_language(:bookmarks)
    @goals = fetch_activity_by_language(:goals)
    @journals = fetch_activity_by_language(:journals)

    ar = []
    ar.push(@bookmarks)
    ar.push(@goals)
    ar.push(@journals)

    total_entries_by_language = ar.inject { |memo, el| memo.merge(el) { |_k, old_v, new_v| old_v + new_v } }

    render json: {
      bookmarks_by_language: @bookmarks,
      goals_by_language: @goals,
      journals_by_language: @journals,
      total_entries_by_language: total_entries_by_language
    }
  end

  def counts
    bookmarks_total = current_user.bookmarks.length
    journals_total = current_user.journals.length
    completed_goals = current_user.goals.where(completed: true).length
    active_goals = current_user.goals.where(completed: false).length

    # Activity by Day
    bookmark_daily_count = current_user.bookmarks.where(created_at:
      (Time.zone.now.midnight - 1.day)..Time.zone.now.midnight).count
    goals_daily_count = current_user.goals.where(created_at:
      (Time.zone.now.midnight - 1.day)..Time.zone.now.midnight).count
    journals_daily_count = current_user.journals.where(created_at:
      (Time.zone.now.midnight - 1.day)..Time.zone.now.midnight).count
    daily_activity = bookmark_daily_count + goals_daily_count + journals_daily_count

    # Activity by week
    bookmark_week_count = current_user.bookmarks.where(created_at:
      (Time.zone.now.midnight - 7.days)..Time.zone.now.midnight).count
    goals_week_count = current_user.goals.where(created_at:
      (Time.zone.now.midnight - 7.days)..Time.zone.now.midnight).count
    journals_week_count = current_user.journals.where(created_at:
      (Time.zone.now.midnight - 7.days)..Time.zone.now.midnight).count
    weekly_activity = bookmark_week_count + goals_week_count + journals_week_count

    render json: {
      bookmarks_total: bookmarks_total,
      journals_total: journals_total,
      completed_goals: completed_goals,
      active_goals: active_goals,
      bookmark_daily_count: bookmark_daily_count,
      journals_daily_count: journals_daily_count,
      goals_daily_count: goals_daily_count,
      daily_activity: daily_activity,
      bookmark_week_count: bookmark_week_count,
      journals_week_count: journals_week_count,
      goals_week_count: goals_week_count,
      weekly_activity: weekly_activity
    }
  end
end
