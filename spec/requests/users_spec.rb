require 'rails_helper'

RSpec.describe "/authentication", type: :request do
  describe "user/sign_in" do
    it "renders the new template" do
      get '/users/sign_in'
      expect(response).to be_successful 
      expect(response).to render_template(:new)
    end
  end

  describe "users/sign_up" do
    it "renders the new template" do
      get '/users/sign_up'
      expect(response).to be_successful 
      expect(response).to render_template(:new)
    end
  end

  describe "/users" do
    it "renders the users template" do
      get '/users'
      expect(response).to be_successful 
      expect(response).to render_template(:users)
    end
  end

end