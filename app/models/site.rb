# class Site < ActiveRecord::Base

#   def nokogiri_trucks
#     urlTrucks = open('http://www.gfoodlounge.com/#schedule/').read

#     pageTrucks = Nokogiri::HTML(urlTrucks)
#     @trucks = []
#     # today = Time.now.strftime("%A, %B %d")

#     @@trucks = pageTrucks.css('li.active a').map do |truck|
#       {title: truck}
#     end

#   end

#   def nokogiri_soups
#     urlSoups = open('http://www.specialtys.com/Location.aspx?Store=SF09#TodaysSoups').read

#     # Nokogiri is the module name, HTML is the class name
#     pageSoups = Nokogiri::HTML(urlSoups)
#     @soups = []

#     @@soups = pageSoups.css('a.soupSelection').map do |soup|
#       # @images = pageSoups.css('a.soupSelection img').each do |img|
#       #   img['src']
#       # end
#      {name: soup.text.strip, img: @images }
#     end
#   end

#   def nokogiri_ga
#     urlGA = open('https://generalassemb.ly/education?where=san-francisco&format=classes-workshops').read
#     pageGA = Nokogiri::HTML(urlGA)
#     scripts = pageGA.css('script')
#     a = scripts.select {|s| s.text.include? "EDUCATIONAL_OFFERINGS_JSON"}.first.content.split("\n")


#     # binding.pry
#     @parsedScript = JSON.parse(a[1].match(/\[[^;]*/).to_s).take(7)
#     @@gaCourses = @parsedScript.sort_by{|course| course["starts"] }

#   end
# end
