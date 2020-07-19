require 'rails_helper'

RSpec.describe "Goals", type: :request do
  describe 'GET #index' do
    it 'responds successfully to retrieve a users goals' do
      get '/goals', headers: authenticated_header
    
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'when the goal is valid' do
      before(:example) do
        @goal_params = attributes_for(:goal)
        post '/goals', params: { goal: @goal_params }, headers: authenticated_header
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the goal to the database' do
        expect(Goal.last.title).to eq(@goal_params[:title])
      end
    end
  end
end
