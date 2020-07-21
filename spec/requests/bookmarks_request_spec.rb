require 'rails_helper'

RSpec.describe 'Bookmarks', type: :request do
  describe 'GET #index' do
    it 'responds successfully to retrieve a users bookmarks' do
      get '/bookmarks', headers: authenticated_header

      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'when the bookmark is valid' do
      before(:example) do
        @bookmark_params = attributes_for(:bookmark)
        post '/bookmarks', params: { bookmark: @bookmark_params }, headers: authenticated_header
      end

      it 'returns http created' do
        expect(response).to have_http_status(:created)
      end

      it 'saves the bookmark to the database' do
        expect(Bookmark.last.title).to eq(@bookmark_params[:title])
      end
    end
  end

  describe 'PUT #update' do
    context 'when the params are valid' do
      before(:example) do
        @bookmark = create(:bookmark)
        @updated_title = 'Updated bookmark'
        put "/bookmarks/#{@bookmark.id}", params: { bookmark: { title: @updated_title } }, headers: authenticated_header
      end

      it 'has a http no content response' do
        expect(response).to have_http_status(:success)
      end

      it 'updates the bookmark in the database' do
        expect(Bookmark.find(@bookmark.id).title).to eq(@updated_title)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when the bookmark is valid' do
      before(:example) do
        bookmark = create(:bookmark)
        delete "/bookmarks/#{bookmark.id}", headers: authenticated_header
      end

      it 'has a http no content response' do
        expect(response).to have_http_status(:no_content)
      end

      it 'returns http deleted' do
        expect(response).to have_http_status(:no_content)
      end

      it 'removes the bookmark from the database' do
        expect(Bookmark.count).to eq(0)
      end
    end
  end
end
