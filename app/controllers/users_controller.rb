class UsersController < ApplicationController
  before_action :authenticate_user, only: [:update]

  def index
    render json: {
      user: {
        id: current_user.id,
        username: current_user.username,
        email: current_user.email
      }
    }
  end

  def dashboard
    latest_journals = current_user.journals.last(3)
    goals_due_soonest = current_user.goals.order("due_date DESC").last(3) 
    def total_entries_by_date
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
      return total_entries_by_date
    end

    render json: {
      latest_journals: latest_journals,
      goals_due_soonest: goals_due_soonest,
      total_entries_by_date: total_entries_by_date
    }
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: 'User Created', status: :ok
    else 
      render json: user.errors.full_messages
    end
  end

  def destroy
    current_user.delete
    render json: 'User Deleted', status: :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end
end
