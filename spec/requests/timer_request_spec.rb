require 'rails_helper'

RSpec.describe "Timers", type: :request do

  describe "GET #index" do
    it "responds successfully to retrieve a users timer total" do
      get "/timer", headers: authenticated_header
      expect(response).to have_http_status(:ok)
    end
  end


  # describe "POST #update" do
  #   it "returns http success" do
  #     POST "/timer/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
