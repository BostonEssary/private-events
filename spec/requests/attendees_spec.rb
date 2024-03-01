require 'rails_helper'

RSpec.describe "Attendees", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/attendees/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/attendees/new"
      expect(response).to have_http_status(:success)
    end
  end

end
