class SitesController < ApplicationController
  def index
    @user = User.new
    
    @shoutout = Shoutout.new

    @shoutouts_all = Shoutout.all

    @current_user = User.find_by_id(session[:id])

    # puts "!!!!!!!!!!!!!!#{@current_user}!!!!!!!!!!!!!!!!!"
  end
  def show

  end
end
