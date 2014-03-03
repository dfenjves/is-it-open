class Museum
	attr_reader :yelp_object, :name, :schedule, :week_hash

	def initialize(yelp_object)
		@yelp_object = yelp_object
		@name = yelp_object.name
		@schedule = yelp_object.schedule
		binding.pry
		set_week_hash
		set_times(:wednesday)
	end

	def set_week_hash
		@week_hash = {
			:monday => schedule[0],
			:tuesday => schedule[1],
			:wednesday => schedule[2],
			:thursday => schedule[3],
			:friday => schedule[4],
			:saturday => schedule[5],
			:sunday => schedule[6]
		}
	end

	def set_times(day)
		if week_hash[day] == "Closed"
			"Closed"
		else
			opening_string = week_hash[day].split(" - ")[0]
			t = Time.new(2000,1,1,(opening_string[0..1].to_i),(opening_string[3..4].to_i))
			@open = t.strftime("%H:%M")
			closing_string = week_hash[day].split(" - ")[1]
			p = Time.new(2000,1,1,(closing_string[0..1].to_i+12),(closing_string[3..4].to_i))
			@close = p.strftime("%H:%M")
		end
	end

	def monday_times

	end
	
	def tuesday_times
	end
end