class MuseumsController < ApplicationController

	get '/' do
		@museums = Museum.all
		@current_time = Time.now.strftime("%I:%M %p")
		erb :index
	end

end