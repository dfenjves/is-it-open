class MuseumsController < ApplicationController

	get '/' do
		@museums = Museum.all
		erb :index
	end

end