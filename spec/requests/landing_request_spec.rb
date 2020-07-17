require 'rails_helper'

RSpec.describe "Landings", type: :request do
  it 'responds successfully to display landing page' do
    get '/'
  
    expect(response).to have_http_status(:success)
  end
end
