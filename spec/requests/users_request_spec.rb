require 'rails_helper'

RSpec.describe "Users", type: :request do
  it 'responds successfully' do
    get '/bookmarks', headers: authenticated_header
  
    expect(response).to have_http_status(:success)
  end
end
