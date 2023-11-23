require 'rails_helper'

RSpec.describe "Proponents", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/proponents/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/proponents/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/proponents/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /_form" do
    it "returns http success" do
      get "/proponents/_form"
      expect(response).to have_http_status(:success)
    end
  end

end
