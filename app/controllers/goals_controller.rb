class GoalsController < ApplicationController
  before_action :authenticate_user
  before_action :set_goal, only: %i[show update destroy]

  def index
    # Returns active goals only
    goals = current_user
            .goals.where(completed: false)
            .order(created_at: 'desc')
            .paginate(page: params[:page])
    render json: {
      goals: goals.as_json(include: %i[category language]),
      total_entries: current_user.goals.where(completed: false).length,
      current_user: current_user.username
    }
  end

  def completed_goals
    # Returns achieved goals only
    goals = current_user
            .goals.where(completed: true)
            .order(id: 'desc')
            .paginate(page: params[:page])
    render json: {
      goals: goals.as_json(include: %i[category language]),
      total_entries: current_user.goals.where(completed: true).length,
      current_user: current_user.username
    }
  end

  def show
    render json: @goal
  end

  def create
    goal = current_user.goals.create(goal_params)
    if goal.save
      render json: goal, status: :created
    else
      render json: { errors: goal.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @goal.update(goal_params)
    render json: 'Goal Updated', status: :ok
  end

  def destroy
    @goal.delete
    render json: 'Goal Deleted', status: :no_content
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(
      :title,
      :description,
      :body,
      :due_date,
      :user_id,
      :completed,
      :completed_date,
      :category_id,
      :language_id
    )
  end
end
