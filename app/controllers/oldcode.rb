class AnalyticsController < ApplicationController
  before_action :authenticate_user

  def entries_by_date
    bookmarks = current_user.bookmarks.group_by_day(
      :created_at,
      format: '%Y-%m-%d',
      range: 4.weeks.ago.midnight..Time.zone.now
    ).count
    journals = current_user.journals.group_by_day(
      :created_at,
      format: '%Y-%m-%d',
      range: 4.weeks.ago.midnight..Time.zone.now
    ).count
    goals = current_user.goals.group_by_day(
      :created_at,
      format: '%Y-%m-%d',
      range: 4.weeks.ago.midnight..Time.zone.now
    ).count

    entries_array = []
    entries_array.push(bookmarks)
    entries_array.push(goals)
    entries_array.push(journals)

    total_entries_by_date = entries_array.inject { |memo, el| memo.merge(el) { |_k, old_v, new_v| old_v + new_v } }

    render json: {
      total_entries_by_date: total_entries_by_date,
      bookmarks: bookmarks,
      goals: goals,
      journals: journals
    }
  end

  def categories
    bookmarks_by_category = current_user.bookmarks.joins(:category).group(:name).count(:name)
    goals_by_category = current_user.goals.joins(:category).group(:name).count(:name)
    journals_by_category = current_user.journals.joins(:category).group(:name).count(:name)

    cat_array = []
    cat_array.push(bookmarks_by_category)
    cat_array.push(goals_by_category)
    cat_array.push(journals_by_category)

    total_entries_by_category = cat_array.inject { |memo, el| memo.merge(el) { |_k, old_v, new_v| old_v + new_v } }

    render json: {
      total_entries_by_category: total_entries_by_category,
      bookmarks_by_category: bookmarks_by_category,
      goals_by_category: goals_by_category,
      journals_by_category: journals_by_category
    }
  end

  def languages
    bookmarks_by_language = current_user.bookmarks.joins(:language).group(:name).count(:name)
    goals_by_language = current_user.goals.joins(:language).group(:name).count(:name)
    journals_by_language = current_user.journals.joins(:language).group(:name).count(:name)

    ar = []
    ar.push(bookmarks_by_language)
    ar.push(journals_by_language)
    ar.push(goals_by_language)

    total_entries_by_language = ar.inject { |memo, el| memo.merge(el) { |_k, old_v, new_v| old_v + new_v } }

    render json: {
      bookmarks_by_language: bookmarks_by_language,
      goals_by_language: goals_by_language,
      journals_by_language: journals_by_language,
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
