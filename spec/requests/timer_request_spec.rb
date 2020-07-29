require 'rails_helper'

RSpec.describe "Timers", type: :request do

  describe "GET #index" do
    it "responds successfully to retrieve a users timer total" do
      get "/timer", headers: authenticated_header
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
  before(:example) do 
    @timer = create(:timer)
    @timer_params = attributes_for(:timer)
    post "/timer", params: { timer: @timer_params }, headers: authenticated_header
  end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it 'saves the timer to the database' do
      expect(Timer.last.time_length).to eq(@timer_params[:time_length])
    end
  end
end