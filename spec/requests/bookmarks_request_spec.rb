require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  # describe 'GET #index' do
  #   before(:example) do
  #     @first_bookmark = create(:bookmark)
  #     @last_trail = create(:bookmark)
  #     get '/bookmarks', headers: {authenticated_header}
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
end
