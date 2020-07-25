require 'rails_helper'

RSpec.describe 'Statuses', type: :request do

  describe "GET /status/user" do
    it "returns http OK" do
      get "/status/user", headers: authenticated_header
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /status" do
    it "returns http OK & message 'logged in'" do
      get "/status", headers: authenticated_header
      expect(response).to have_http_status(:ok)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['message'].length).to eq(9)
    end
  end
end
