require 'rails_helper'

RSpec.describe "App::Controllers::Abouts", type: :request do
  describe "GET /about" do
    it "returns http success" do
      get "/app/controllers/about/about"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /us" do
    it "returns http success" do
      get "/app/controllers/about/us"
      expect(response).to have_http_status(:success)
    end
  end

end
