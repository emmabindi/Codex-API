class GoalsController < ApplicationController
  before_action :authenticate_user
  before_action :set_goal, only: %i[show update destroy]

  def index
    goals = current_user.goals.paginate(page: params[:page])
    render json: { goals: goals.as_json(include: :categories), current_user: current_user.username }
  end

  def show
    render json: @goal
  end

  def create
    goal = current_user.goals.create(goal_params)
    render json: goal, status: 201
  end

  def update
    @goal.update(goal_params)
    render json: 'Goal Updated', status: 200
  end

  def destroy
    @goal.destroy
    render json: 'Goal Deleted', status: 204
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :url, :user_id, :completed)
  end
end
