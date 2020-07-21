require 'rails_helper'

RSpec.describe 'Journals', type: :request do
  describe 'GET #index' do
    it 'responds successfully to retrieve a users journal entries' do
      get '/journals', headers: authenticated_header

      expect(response).to have_http_status(:success)
    end
  end

    describe 'POST #create' do
      context 'when the journal is valid' do
        before(:example) do
          @journal = create(:journal)
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

  describe 'PUT #update' do
    context 'when the params are valid' do
      before(:example) do
        @journal = create(:journal)
        @updated_title = 'Updated Journal'
        put "/journals/#{@journal.id}", params: { journal: { title: @updated_title } }, headers: authenticated_header
      end

      it 'has a http no content response' do
        expect(response).to have_http_status(:success)
      end

      it 'updates the journal in the database' do
        expect(Journal.find(@journal.id).title).to eq(@updated_title)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when the journal is valid' do
      before(:example) do
        journal = create(:journal)
        delete "/journals/#{journal.id}", headers: authenticated_header
      end

      it 'has a http no content response' do
        expect(response).to have_http_status(:no_content)
      end

      it 'returns http deleted' do
        expect(response).to have_http_status(:no_content)
      end

      it 'removes the journal from the database' do
        expect(Journal.count).to eq(0)
      end
    end
  end
end
