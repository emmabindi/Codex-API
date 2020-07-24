class AnalyticsController < ApplicationController
  before_action :authenticate_user

  def entries_by_date 
    # http://localhost:3000/user/1/analytics/activity
    bookmarks = current_user.bookmarks.group_by_day(:created_at, format: "%Y-%m-%d", range: 4.weeks.ago.midnight..Time.now).count
    journals = current_user.journals.group_by_day(:created_at, format: "%Y-%m-%d", range: 4.weeks.ago.midnight..Time.now).count
    goals = current_user.goals.group_by_day(:created_at, format: "%Y-%m-%d", range: 4.weeks.ago.midnight..Time.now).count

    entries_array = []
    entries_array.push(bookmarks)
    entries_array.push(goals)
    entries_array.push(journals)

    total_entries_by_date = entries_array.inject{|memo, el| memo.merge( el ){|k, old_v, new_v| old_v + new_v}}

    render json: {
      total_entries_by_date: total_entries_by_date,
      bookmarks: bookmarks,
      goals: goals,
      journals: journals,
    }
  end

  def categories 
    # http://localhost:3000/user/1/analytics/categories
    bookmarks_by_category = current_user.bookmarks.joins(:category).group(:name).count(:name)
    goals_by_category = current_user.goals.joins(:category).group(:name).count(:name)
    journals_by_category = current_user.journals.joins(:category).group(:name).count(:name)

    cat_array = []
    cat_array.push(bookmarks_by_category)
    cat_array.push(goals_by_category)
    cat_array.push(journals_by_category)

    total_entries_by_category = cat_array.inject{|memo, el| memo.merge( el ){|k, old_v, new_v| old_v + new_v}}

    render json: {
      total_entries_by_category: total_entries_by_category,  
      bookmarks_by_category: bookmarks_by_category,
      goals_by_category: goals_by_category, 
      journals_by_category: journals_by_category,
    }
  end 

  def languages
    # http://localhost:3000/user/1/analytics/languages
    bookmarks_by_language = current_user.bookmarks.joins(:language).group(:name).count(:name)
    goals_by_language = current_user.goals.joins(:language).group(:name).count(:name)
    journals_by_language = current_user.journals.joins(:language).group(:name).count(:name)

    ar = []
    ar.push(bookmarks_by_language)
    ar.push(journals_by_language) 
    ar.push(goals_by_language)

    total_entries_by_language = ar.inject{|memo, el| memo.merge( el ){|k, old_v, new_v| old_v + new_v}}

    render json: {
      bookmarks_by_language: bookmarks_by_language,
      goals_by_language: goals_by_language, 
      journals_by_language: journals_by_language,
      total_entries_by_language: total_entries_by_language, 
    }
  end

  def counts
    # http://localhost:3000/user/1/analytics/counts
    bookmarks_total = current_user.bookmarks.length
    journals_total = current_user.journals.length
    completed_goals = Goal.where(completed: true).length
    active_goals = Goal.where(completed: false).length

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

    # User.first.goals.select("count(*) AS count, to_char(created_at, 'YYYY-MM-DD') AS day").group("day").order("day").where(created_at: (1.month.ago..Time.current))
    # This is giving an array with created_at and the date.. 

    # Order.all(:group => "date(created_at)", :order => "created_at")


    # User.first.goals.group_by_day(:created_at, day_start: 23).count
    # => {Sun, 12 Jul 2020=>2, Mon, 13 Jul 2020=>0, Tue, 14 Jul 2020=>0, Wed, 15 Jul 2020=>0, Thu, 16 Jul 2020=>2, Fri, 17 Jul 2020=>1, Sat, 18 Jul 2020=>1, Sun, 19 Jul 2020=>2, Mon, 20 Jul 2020=>2, Tue, 21 Jul 2020=>1, Wed, 22 Jul 2020=>0, Thu, 23 Jul 2020=>1}

    # User.group_by_day(:created_at, range: 2.weeks.ago.midnight..Time.now).count

    # User.group_by_week(:created_at, last: 8).count # last 8 weeks

    # User.group_by_month(:created_at, format: "%b %Y").count
    # # {
    # #   "Jan 2020" => 10
    # #   "Feb 2020" => 12
    # # }
    

    # current_user.bookmarks.group_by_day(:created_at, range: 4.weeks.ago.midnight..Time.now).count

    # User.first.bookmarks.group_by_day(:created_at, format: "%Y-%m-%d", range: 4.weeks.ago.midnight..Time.now).count