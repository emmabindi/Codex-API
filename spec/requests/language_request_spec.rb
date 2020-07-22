require 'rails_helper'

RSpec.describe "Languages", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/language/index"
      expect(response).to have_http_status(:success)
    end
  end

end
