require 'rails_helper'

RSpec.describe "Journals", type: :request do
  describe 'GET #index' do
    it 'responds successfully to retrieve a users journal entries' do
      get '/journals', headers: authenticated_header
    
      expect(response).to have_http_status(:success)
    end

    describe 'POST #create' do
      context 'when the journal is valid' do
        before(:example) do
          @journal_params = attributes_for(:journal)
          post '/journals', params: { journal: @journal_params }, headers: authenticated_header
        end
  
        it 'returns http created' do
          expect(response).to have_http_status(:created)
        end
  
        it 'saves the bookmark to the database' do
          expect(Journal.last.title).to eq(@journal_params[:title])
        end
      end
    end
  end
end
