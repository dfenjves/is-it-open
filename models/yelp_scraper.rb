require 'pry'

class YelpScraper
	attr_accessor :url, :location_data, :name, :schedule

	def initialize(url)
		self.url = url
		html = open("#{url}",
   "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.117 Safari/537.36")
		self.location_data = Nokogiri::HTML(html)
		scrape_museum_name
		scrape_museum_schedule
	end

	def scrape_museum_name
		@name = location_data.css("h1.biz-page-title").text.gsub("\n","").strip
		@name
	end

	def scrape_museum_schedule
		full_schedule = location_data.css("table.table.table-simple.hours-table td")

		clean_schedule = full_schedule.collect {|item| item.text}

		schedule_array = []

		clean_schedule.collect do |sched|
			if sched.match(/Closed|am|pm/)
				schedule_array << sched.gsub("\n", "").strip
			end
		end

		@schedule = schedule_array.delete_if { |item| item if item.match(/Closed now| Open now/)}
	end


end