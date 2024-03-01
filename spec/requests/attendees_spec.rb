require 'rails_helper'

RSpec.describe "Attendees", type: :request do

  describe "POST /attendees" do
    it "returns http success" do
      user = create(:user)
      event = create(:event, creator_id: user.id)
      sign_in user

      post "/attendees", :params => {
        :event_id => event.id}
      expect(response).to have_http_status(:found)
    end
  end
end
