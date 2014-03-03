require_relative '../config/environment'

moma_html = open("http://www.yelp.com/biz/museum-of-the-moving-image-astoria",
   "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.117 Safari/537.36")
moma = Nokogiri::HTML(moma_html)

today_schedule = moma.css("span.hour-range").text

full_schedule = moma.css("table.table.table-simple.hours-table td")

clean_schedule = full_schedule.collect {|item| item.text}

schedule_array = []

clean_schedule.collect do |sched|
	if sched.match(/Closed|am|pm/)
		schedule_array << sched.gsub("\n", "").strip
	end
end




# consumer_key = 'XZrdNm5A-UcEV7OE6qgJ3A'
# consumer_secret = 'mlmX4YEdzJ5pNHxnznNq3a9-Jn4'
# token = '2s0cJh5CamOG_mi9yV7GZM_JJ08KljiM'
# token_secret = 'MkMHzF4iKeH5a0416qZ88OoaTHE'

# api_host = 'api.yelp.com'

# consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
# access_token = OAuth::AccessToken.new(consumer, token, token_secret)

# path = "/v2/search?term=restaurants&location=new%20york"

# parsed = JSON.parse(access_token.get(path).body)
# binding.pry