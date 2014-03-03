require_relative 'spec_helper'

describe YelpScraper do
	
	let (:new_museum) {YelpScraper.new("http://www.yelp.com/biz/museum-of-the-moving-image-astoria")}

	it 'accepts a yelp url' do
		expect(new_museum.url).to eq("http://www.yelp.com/biz/museum-of-the-moving-image-astoria")
	end

	it 'returns a scrape of the full museum html' do
			expect(new_museum.location_data.blank?).to be(false)
	end

	it 'returns the name of the museum' do
		expect(new_museum.scrape_museum_name).to eq("Museum of the Moving Image")
	end

	it 'returns the museum\'s weekly schedule' do
		expect(new_museum.schedule.count).to eq(7)
	end


end