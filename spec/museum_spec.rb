require_relative 'spec_helper'

describe Museum do	

	let (:astoria_yelp) {YelpScraper.new("http://www.yelp.com/biz/museum-of-the-moving-image-astoria")}
	let (:astoria) {Museum.new.tap { |x| x.new_museum_from_yelp(astoria_yelp)}}

	it 'accepts a yelp scraper object upon initialization' do
		expect(astoria.yelp_object).to be_an_instance_of(YelpScraper)
	end

	it 'has a museum name' do
		expect(astoria.name).to eq("Museum of the Moving Image")
	end

	it 'has an overall schedule' do
		expect(astoria.schedule.count).to eq(8)
	end

	it 'returns a hash with schedule for each weekday' do
		expect(astoria.week_hash.values).to include("Closed")
	end

	it 'populates a database with opening and closing times for each day' do
		expect(astoria.monday_open).to eq("Closed")
		expect(astoria.wednesday_open).to eq("10:30")
		expect(astoria.wednesday_close).to eq("17:00")
	end


end