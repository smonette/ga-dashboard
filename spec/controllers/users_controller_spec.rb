require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "User CRUD" do
    it "will create a user" do
      user = User.new(first_name: "Adam", 
        last_name: "Budik", email: "as@bud.com", 
        password: "blahblah", password_confirmation: "blahblah")
      expect(user.save).to eq(true)
    end

    it "will render error message on create" do
      user = User.new(first_name: "Adam",
        last_name: "Budik",
        email: "dsfsdafsd",
        password: "blahblah",
        password_confirmation: "nono")
      expect(user.save).to eq(false)
    end

    it "render the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end


end
