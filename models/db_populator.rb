class DBPopulator
	attr_accessor :csvfile

	def initialize(csvfile)
		@csvfile = csvfile
	end

	def parse_csv
		@museums = CSV.read(csvfile).flatten
		@museums
	end

	def populate_db
		parse_csv.each do |url|
			puts "parsing #{url}"
			yelp_museum = YelpScraper.new(url)
			museum = Museum.new
			museum.url = url
			museum.new_museum_from_yelp(yelp_museum)
		end
	end

end