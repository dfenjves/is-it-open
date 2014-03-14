require 'bundler/setup'
Bundler.require(:default)
require 'open-uri'
require 'time'
require 'csv'
require_relative '../models/museum'
require_relative '../models/yelp_scraper'
require_relative '../models/db_populator'
require_relative '../models/check_if_open'
require_relative '../controllers/application_controller'
require_relative '../controllers/museums_controller'


# ActiveRecord::Base.establish_connection(
#   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#   :host     => db.host,
#   :username => db.user,
#   :password => db.password,
#   :database => db.path[1..-1],
#   :encoding => 'utf8'
# )

ActiveRecord::Base.establish_connection('postgres://kczptvfljneali:nXpOWy8jaeZltPWpMeC-2DuD1J@ec2-54-235-246-73.compute-1.amazonaws.com:5432/d5act6df4bhjuk')
# ActiveRecord::Base.establish_connection('postgres://localhost/isitopen')