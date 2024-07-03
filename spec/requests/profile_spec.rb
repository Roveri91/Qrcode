require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  describe "GET /index" do
    it "responds successfully" do
      get '/profiles'
      expect(response).to be_successful  #.to have_http_status(200) works as well
    end
  end
end
