require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /index" do
    it "returns http success" do
      user = create(:user)
      sign_in user
      get "/events/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      user = create(:user)
      sign_in user
      get "/events/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "creates an event and redirects to the event page" do
      
      user = create(:user)
      sign_in user
  
      post "/events", :params => {
        :event =>{
          title: "My Event", 
          location: "My House", 
          description: "Party at my place",
          event_date_time:  Time.new(2024, 6, 13, 12, 30)
          }}
      expect(response).to have_http_status(:found)
    end
  end

  

  describe "GET /update" do
    it "returns http success" do
      user = create(:user)
      sign_in user
      get "/events/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      user = create(:user)
      sign_in user
      get "/events/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      user = create(:user)
      
      get "/events/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
