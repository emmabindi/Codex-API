require 'rails_helper'

RSpec.describe 'Journals', type: :request do
  describe 'GET #index' do
    it 'responds successfully to retrieve a users journal entries' do
      get '/journals', headers: authenticated_header

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    before(:example) do
      @journal = create(:journal)
      @journal_params = attributes_for(:journal)
      get "/journals/#{@journal.id}", headers: authenticated_header
    end
    
    it 'responds successfully to retrieve a journal' do
      expect(response).to have_http_status(:ok)
    end
  end

    describe 'POST #create' do
      context 'when the journal is valid' do
        before(:example) do
          @user = create(:user)
          @category = create(:category)
          @language = create(:language)
          @journal_params = attributes_for(:journal)
          @journal_params[:category_id] = @category.id
          @journal_params[:language_id] = @language.id
          @journal_params[:user_id] = @user.id
          post '/journals', params: { journal: @journal_params }, headers: authenticated_header
        end

        it 'returns http created' do
          expect(response).to have_http_status(:created)
        end

        it 'saves the journal to the database' do
          expect(Journal.last.title).to eq(@journal_params[:title])
        end
      end

      context 'when the journal is invalid' do
        before(:example) do
          @journal_params = attributes_for(:journal, :invalid)
          post '/journals', params: { journal: @journal_params }, headers: authenticated_header
          @json_response = JSON.parse(response.body)
      end
  
      it 'returns status unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
  
      it 'errors contains the correct message' do
        expect(@json_response['errors'][0]).to eq("Title can't be blank")
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
