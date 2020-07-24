class JournalsController < ApplicationController
  before_action :authenticate_user
  before_action :set_journal, only: %i[show update destroy]

  def index
    journals = current_user.journals.order(id: 'desc').paginate(page: params[:page])
    render json: {
      journals: journals.as_json(include: %i[category language]),
      total_entries: current_user.journals.length,
      current_user: current_user.username
    }
  end

  def show
    render json: @journal
  end

  def create
    journal = current_user.journals.create(journal_params)
    render json: journal, status: :created
  end

  def update
    @journal.update(journal_params)
    render json: 'Journal Updated', status: :ok
  end

  def destroy
    @journal.delete
    render json: 'Journal Deleted', status: :no_content
  end

  private

  def set_journal
    @journal = Journal.find(params[:id])
  end

  def journal_params
    params.require(:journal).permit(
      :title,
      :body,
      :user_id,
      :category_id,
      :language_id
    )
  end
end
