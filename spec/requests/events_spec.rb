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

  describe "GET events/:id/edit" do
    it "returns http success" do
      user = create(:user)
      event = create(:event, creator_id: user.id)
      sign_in user
      get "/events/#{event.id}/edit" 
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH events/:id" do
    it "returns http success" do
      user = create(:user)
      event = create(:event, creator_id: user.id)
      sign_in user
      patch "/events/#{event.id}", :params => {
        :event =>{
          title: "Edited", 
          location: "My House", 
          description: "Party at my place",
          event_date_time:  Time.new(2024, 6, 13, 12, 30)
          }}    
      expect(response).to have_http_status(:found)
      expect(Event.find(event.id).title).to eq("Edited")
    end
  end

  describe "DELETE /events/:id" do
    it "returns http success" do
      user = create(:user)
      event = create(:event, creator_id: user.id)
      count = Event.count
      sign_in user

      delete "/events/#{event.id}"
      expect(Event.count).to eq(count-1)
      expect(response).to have_http_status(:found)
    end
  end

  describe "GET /events/:id" do
    it "returns http success" do
      user = create(:user)
      event = create(:event, creator_id: user.id)
      count = Event.count
      sign_in user

      get "/events/#{event.id}"
      expect(response).to have_http_status(:success)
    end

  end

end
