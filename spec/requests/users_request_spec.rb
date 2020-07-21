require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'responds successfully to retrieve a users information' do
      get '/current-user', headers: authenticated_header

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'when the user is valid' do
      before(:example) do
        @user_params = attributes_for(:user)
        post '/sign-up', params: { user: @user_params }, headers: authenticated_header
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the user to the database' do
        expect(User.last.email).to eq(@user_params[:email])
      end
    end
  end
end
