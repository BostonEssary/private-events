require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users/:id" do
    it "returns http success" do
      user = create(:user)
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end
  end

end
