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
  def nokogiri
    url = open('http://www.gfoodlounge.com/truckschedule/').read

    # Nokogiri is the module name, HTML is the class name
    page = Nokogiri::HTML(url)
    results = []

    results = page.css('.title a').map do |link|
      {title: link.text, url: link["href"]}
    end

  end
end
