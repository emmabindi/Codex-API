require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  # describe 'GET #index' do
  #   before(:example) do
  #     @first_bookmark = create(:bookmark)
  #     @last_bookmark = create(:bookmark)
  #     get '/bookmarks'
  #     @json_response = JSON.parse(response.body)
  #   end

  #   it 'returns http success' do
  #     expect(response).to have_http_status(:success)
  #   end

  #   it 'JSON response contains the correct number of entries' do
  #     expect(@json_response['bookmarks'].count).to eq(2)
  #   end

  #   it 'JSON response body contains expected attributes' do
  #     expect(@json_response['bookmarks'][0]).to include({
  #       'id' => @first_bookmark.id,
  #       'name' => @first_bookmark.title,
  #       'description' => @first_bookmark.description,
  #       'url' => @first_bookmark.url,
  #       'user_id' => @first_bookmark.user_id
  #     }) 
  #   end
  # end

  # describe 'POST #create' do
  #   context 'when the bookmark is valid' do
  #     before(:example) do
  #       @bookmark_params = attributes_for(:bookmark)
  #       post '/bookmarks', params: { bookmark: @bookmark_params }, headers: authenticated_header
  #     end

  #     it 'returns http created' do
  #       expect(response).to have_http_status(:created)
  #     end

  #     # it 'saves the bookmark to the database' do
  #     #   expect(bookmark.last.name).to eq(@bookmark_params[:name])
  #     # end
  #   end
  # end
end
