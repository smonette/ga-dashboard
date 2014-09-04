require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  describe "User Login" do
    it "will create a new session" do
      User.authenticate("steph@mail.com", "12341234")
      expect(session[:id]).to eq(!nil)
    end

    it "will log user out" do
      get :destroy
      expect(session[:id]).to eq(nil)
    end

  end
end
