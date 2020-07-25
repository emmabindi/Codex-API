require 'rails_helper'

RSpec.describe 'Analytics', type: :request do

  describe "GET /analytics/counts" do
    it "returns http success" do
      get "/analytics/counts", headers: authenticated_header
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /analytics/activity" do
    it "returns http success" do
      get "/analytics/activity", headers: authenticated_header
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /analytics/categories" do
    it "returns http success" do
      get "/analytics/categories", headers: authenticated_header
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /analytics/languages" do
    it "returns http success" do
      get "/analytics/languages", headers: authenticated_header
      expect(response).to have_http_status(:success)
    end
  end

end
