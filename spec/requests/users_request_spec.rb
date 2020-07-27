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

      it 'returns http ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'saves the user to the database' do
        expect(User.last.email).to eq(@user_params[:email])
      end
    end
  end

  describe 'DELETE #destroy' do
    before(:example) do
      user = create(:user)
      delete "/user/#{user.id}", headers:
      authenticated_header
    end

    it 'has a http no content response' do
      expect(response).to have_http_status(:no_content)
    end

    it 'returns http deleted' do
      expect(response).to have_http_status(:no_content)      
    end
  end
end
