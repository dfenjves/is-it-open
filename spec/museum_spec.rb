require_relative 'spec_helper'

describe Museum do	

	let (:astoria_yelp) {YelpScraper.new("http://www.yelp.com/biz/museum-of-the-moving-image-astoria")}
	let (:astoria) {Museum.new(astoria_yelp)}

	it 'accepts a yelp scraper object upon initialization' do
		expect(astoria.yelp_object).to be_an_instance_of(YelpScraper)
	end

	it 'has a museum name' do
		expect(astoria.name).to eq("Museum of the Moving Image")
	end

	it 'has an overall schedule' do
		expect(astoria.schedule.count).to eq(7)
	end

	it 'returns a hash with schedule for each weekday' do
		expect(astoria.week_hash.values).to include("Closed")
	end

	it 'can parse the opening and closing times for each day of the week' do
	end


end