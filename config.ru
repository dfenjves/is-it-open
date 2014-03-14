require './config/environment'
use Rack::Static, :urls => ['/css'], :root => 'public' # Rack fix allows seeing the css folder.


use MuseumsController
run ApplicationController
