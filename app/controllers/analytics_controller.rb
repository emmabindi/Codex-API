class AnalyticsController < ApplicationController
  before_action :authenticate_user

  def index
    bookmarks_total = current_user.bookmarks.length
    journals_total = current_user.journals.length
    completed_goals = Goal.where(completed: true).length
    active_goals = Goal.where(completed: false).length

    # method to count total of entries based on a category or language 
    # array of dates for goals 

    # Categories:
    bookmarks_by_category = current_user.bookmarks.joins(:category).group(:name).count(:name)

    goals_by_category = current_user.goals.joins(:category).group(:name).count(:name)

    journals_by_category = current_user.journals.joins(:category).group(:name).count(:name)

    cat_array = []
    cat_array.push(bookmarks_by_category)
    cat_array.push(goals_by_category)
    cat_array.push(journals_by_category)

    total_entries_by_category = cat_array.inject{|memo, el| memo.merge( el ){|k, old_v, new_v| old_v + new_v}}


    # Languages:
    bookmarks_by_language = current_user.bookmarks.joins(:language).group(:name).count(:name)

    goals_by_language = current_user.goals.joins(:language).group(:name).count(:name)

    journals_by_language = current_user.journals.joins(:language).group(:name).count(:name)

    ar = []
    ar.push(bookmarks_by_language)
    ar.push(journals_by_language) 
    ar.push(goals_by_language)

    total_entries_by_language = ar.inject{|memo, el| memo.merge( el ){|k, old_v, new_v| old_v + new_v}}


    # Activity by Day 

    bookmark_daily_count = current_user.bookmarks.where(:created_at => (Time.now.midnight - 1.day)..Time.now.midnight).count
    goals_daily_count = current_user.goals.where(:created_at => (Time.now.midnight - 1.day)..Time.now.midnight).count
    journals_daily_count = current_user.journals.where(:created_at => (Time.now.midnight - 1.day)..Time.now.midnight).count
    daily_activity = bookmark_daily_count + goals_daily_count + journals_daily_count

    # Activity by week 

    bookmark_week_count = current_user.bookmarks.where(:created_at => (Time.now.midnight - 7.days)..Time.now.midnight).count
    goals_week_count = current_user.goals.where(:created_at => (Time.now.midnight - 7.days)..Time.now.midnight).count
    journals_week_count = current_user.journals.where(:created_at => (Time.now.midnight - 7.days)..Time.now.midnight).count
    weekly_activity = bookmark_week_count + goals_week_count + journals_week_count

  #   MyModel.where("created_at < ?", 2.days.ago)

  #   MyTable.where(created_at: Date.new..2.days.ago)

  # SELECT * FROM clients WHERE (clients.created_at BETWEEN '2008-12-21 00:00:00' AND '2008-12-22 00:00:00')

  # Client.where(
  #     "created_at >= ? AND created_at <= ?", params[:start_date], params[:end_date])

  #   Model.where("created_at IN (?)",
  # (params[:start_date].to_date)..(params[:end_date].to_date))

    render json: { 
      bookmarks_total: bookmarks_total, 
      journals_total: journals_total, 
      completed_goals: completed_goals, 
      active_goals: active_goals,

      bookmarks_by_category: bookmarks_by_category,
      goals_by_category: goals_by_category, 
      journals_by_category: journals_by_category,
      total_entries_by_category: total_entries_by_category,  
      
      bookmarks_by_language: bookmarks_by_language,
      goals_by_language: goals_by_language, 
      journals_by_language: journals_by_language,
      total_entries_by_language: total_entries_by_language, 

      bookmark_daily_count: bookmark_daily_count,
      journals_daily_count: journals_daily_count,
      goals_daily_count: goals_daily_count,
      daily_activity: daily_activity,

      bookmark_week_count: bookmark_week_count,
      journals_week_count: journals_week_count,
      goals_week_count: goals_week_count,
      weekly_activity: weekly_activity,
    }
  end
end


# DISCARDED CODE:
# b = bookmarks_by_language.to_a
# g = goals_by_language.to_a
# j = journals_by_language.to_a

# # def language_merge *hashes
# #   hashes.inject :merge
# # end

# # total_entries_by_language = language_merge(bookmarks_by_language, goals_by_language, journals_by_language);

# total_entries_by_language = bookmarks_by_language.merge!(goals_by_language, journals_by_language)



# # total_entries_by_language = 
# # goals_by_language.each do |k, v|
# #   total_entries_by_language[k] ||= 0
# #   total_entries_by_language[k] += v
# # end
# # # => should give me book + goals 

# total_entries_by_category = bookmarks_by_category.merge(goals_by_category, journals_by_category)