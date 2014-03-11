require 'bundler/setup'
Bundler.require(:default)

require 'time'
require_relative '../models/museum'
require_relative '../models/yelp_scraper'
require_relative '../models/db_populator'
require_relative '../models/check_if_open'
require_relative '../controllers/application_controller'
require_relative '../controllers/museums_controller'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => 'db/development.sqlite3'
)