require 'rails_helper'

RSpec.describe QuotesController, type: :controller do
  # test for loading the homepage
  describe "quotes#index action" do
    it "should successfully load the homepage" do
      get :index # triggers an HTTP GET request to the index action of my controller
      expect(response).to have_http_status(:success) # expects the response to have an http status code that's successful
    end
  end
  # test for loading the about page
  describe "quotes#about action" do
    it "should successfully load the about page" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end
# test for loading the admin page
  describe "quotes#admin action" do
    it "should successfully load the admin page" do
      get :admin
      expect(response).to have_http_status(:success)
    end
  end
# test for loading the new page
  describe "quotes#new action" do
    it "should successfully load the new page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
# test for creating a quote
  describe "quote#create action" do
    it "should successfully create a new quote in the database" do
      post :create, params: { quote: { author: 'Matt V', saying: 'Hello!'} } 
      expect(response).to redirect_to root_path
      expect(flash[:success]).to be_present

      quote = Quote.last
      expect(quote.saying).to eq('Hello!')
      expect(quote.author).to eq('Matt V')
    end
  end

end
