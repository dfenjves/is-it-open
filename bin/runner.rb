require_relative '../config/environment'

	# Museum.each dorak





	list = DBPopulator.new("db/seed_data.csv")
	list.populate_db



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