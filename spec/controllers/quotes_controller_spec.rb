require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  describe "quotes#index action" do
    it "should successfully load the homepage" do
      get :index # triggers an HTTP GET request to the index action of my controller
      expect(response).to have_http_status(:success) # expects the response to have an http status code that's successful
    end
  end
end
