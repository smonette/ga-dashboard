class SitesController < ApplicationController
respond_to :html, :json

  # before_action :nokogiri_soups, :nokogiri_trucks
  def index
    nokogiri_soups
    xml_bart

    @gaCourses = Workshop.all.order(created_at: :asc)

    @user = User.new
    @shoutout = Shoutout.new
    @like = Like.new

    @GA_SF = TWITTER_CLIENT.user_timeline('GA_SF')
    @foodtruck = TWITTER_CLIENT.user_timeline('gloungesf')

    @shoutouts_all = Shoutout.all.order(created_at: :desc)

    @current_user = User.find_by_id(session[:id])

  end
  def show

    # @button1 = @@button1
    # respond_with @button1
  end

  def nokogiri_soups
    urlSoups = open('http://www.specialtys.com/Location.aspx?Store=SF09#TodaysSoups').read

    # Nokogiri is the module name, HTML is the class name
    pageSoups = Nokogiri::HTML(urlSoups)
    @soups = []

    @soups = pageSoups.css('a.soupSelection').map do |soup|
     {name: soup.text.strip }
    end
  end

    def xml_bart
      xmlfile = open('http://api.bart.gov/api/etd.aspx?cmd=etd&orig=MONT&key=MW9S-E7SL-26DU-VV8V').read
      @bartTimes = Crack::XML.parse(xmlfile)['root']
      @trains = []
      @new_time = []


      # @current_time = Time.now.strftime("%B %e, %l:%M %p")
      @new_time = @bartTimes['time'].split(/:\w+ /)
      @current_time = "#{@new_time[0]} #{@new_time[1]}"
      @trains = @bartTimes['station']['etd']

  end

  def json_bart
    xmlfile = open('http://api.bart.gov/api/etd.aspx?cmd=etd&orig=MONT&key=MW9S-E7SL-26DU-VV8V').read
    respond_to do |format|
      format.json { render json: Crack::XML.parse(xmlfile)['root'].to_json }
    end
  end

end
