class SitesController < ApplicationController
  before_action :nokogiri_soups, :nokogiri_trucks
  def index
    @user = User.new

    @shoutout = Shoutout.new

    @shoutouts_all = Shoutout.all

    @current_user = User.find_by_id(session[:id])

  end
  def show

  end

  def nokogiri_trucks
    urlTrucks = open('http://www.gfoodlounge.com/truckschedule/').read

    # Nokogiri is the module name, HTML is the class name
    pageTrucks = Nokogiri::HTML(urlTrucks)
    @trucks = []

    @trucks = pageTrucks.css('.otg-vendor-data a').map do |truck|
      {title: truck.text, url: truck["href"]}
    end
    p @trucks
  end

  def nokogiri_soups
    urlSoups = open('http://www.specialtys.com/Location.aspx?Store=SF09#TodaysSoups').read

    # Nokogiri is the module name, HTML is the class name
    pageSoups = Nokogiri::HTML(urlSoups)
    @soups = []

    @soups = pageSoups.css('a.soupSelection').map do |soup|
      # @images = pageSoups.css('a.soupSelection img').each do |img|
      #   img['src']
      # end
     {name: soup.text.strip, img: @images }
    end
  end

  def nokogiri_ga
    urlGA = open('https://generalassemb.ly/education?where=san-francisco&format=classes-workshops').read

    # Nokogiri is the module name, HTML is the class name
    pageGA = Nokogiri::HTML(urlGA)
    @ga = []

    @ga = pageGA.css('.title a').map do |link|
      {title: link.text, url: link["href"]}
    end
  end
end
