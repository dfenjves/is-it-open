class CheckIfOpen
	attr_accessor :day_of_week, :time_of_day

	def initialize(museum_id)
		@museum = Museum.find(museum_id)
		self.day_of_week = Time.now.localtime.to_date.strftime("%A").downcase
		self.time_of_day = Time.now.localtime.strftime("%H:%M").gsub(":","").to_i
		find_open_and_close
	end

	def find_open_and_close
		@opening = @museum.send("#{day_of_week}_open").gsub(":","").to_i
		@closing = @museum.send("#{day_of_week}_close").gsub(":","").to_i
	end

	def is_open?
		true if time_of_day >= @opening && time_of_day <= @closing
	end

end