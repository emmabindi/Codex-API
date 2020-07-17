require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
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

  # describe 'POST #create' do
  #   context 'when the bookmark is valid' do
  #     before(:example) do
  #       @bookmark_params = attributes_for(:bookmark)
  #       post '/bookmarks', params: { bookmark: @bookmark_params }, headers: authenticated_header
  #     end

  #     it 'returns http created' do
  #       expect(response).to have_http_status(:created)
  #     end

  #     it 'saves the bookmark to the database' do
  #       expect(Bookmark.last.title).to eq(@bookmark_params[:title])
  #     end
  #   end
  # end

end
