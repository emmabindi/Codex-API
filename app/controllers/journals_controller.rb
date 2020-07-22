class JournalsController < ApplicationController
  before_action :authenticate_user
  before_action :set_journal, only: %i[show update destroy]

  def index
    journals = current_user.journals.order(id: 'desc').paginate(page: params[:page])
    render json: { journals: journals.as_json(include: :category), total_entries: current_user.journals.length, current_user: current_user.username }
  end

  def show
    render json: @journal
  end

  def create
    journal = current_user.journals.create(journal_params)
    render json: journal, status: 201
  end

  def update
    @journal.update(journal_params)
    render json: 'Journal Updated', status: 200
  end

  def destroy
    @journal.delete
    render json: 'Journal Deleted', status: 204
  end

  private

  def set_journal
    @journal = Journal.find(params[:id])
  end

  def journal_params
    params.require(:journal).permit(:title, :body, :user_id, :category_id)
  end
end
