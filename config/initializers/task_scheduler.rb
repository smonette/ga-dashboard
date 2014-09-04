require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.new
  scheduler.every '1m' do
    Site.do_something
end