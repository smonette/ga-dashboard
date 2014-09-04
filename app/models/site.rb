class Site < ActiveRecord::Base

  def self.do_something
    Workshop.destroy_all
    urlGA = open('https://generalassemb.ly/education?where=san-francisco&format=classes-workshops').read
    pageGA = Nokogiri::HTML(urlGA)

    scripts = pageGA.css('script')
    a = scripts.select {|s| s.text.include? "EDUCATIONAL_OFFERINGS_JSON"}.first.content.split("\n")


    # binding.pry
    @parsedScript = JSON.parse(a[1].match(/\[[^;]*/).to_s)
    @parseCourses = @parsedScript.sort_by{|course| course["starts"] }
    @gaCourses = @parseCourses.take(20)


    @gaCourses.each do |course|
      Workshop.create(url: course["url"], title: course["title"], date: course["date_description"])
    end
  end
end