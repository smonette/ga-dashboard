class SitesController < ApplicationController
  def index
    @user = User.new
    puts "!!!!!!!!!!!!!!!#{session[:id]}!!!!!!!!!!!!!!!!!!!!!!!!"
    @current_user = User.find_by_id(session[:id])
    # puts "!!!!!!!!!!!!!!#{@current_user}!!!!!!!!!!!!!!!!!"
  end
  def show

  end
end
