class SitesController < ApplicationController
  def index
    @user = User.new
    @current_user = User.find_by_id(5)
    # puts "!!!!!!!!!!!!!!#{@current_user}!!!!!!!!!!!!!!!!!"
  end
  def show

  end
end
