class Museum < ActiveRecord::Base

	attr_reader :schedule, :week_hash, :yelp_object

	def new_museum_from_yelp(yelp_object)
		@yelp_object = yelp_object
		self.name = @yelp_object.name
		@schedule = yelp_object.schedule
		set_week_hash
		save_weeks_data
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
			open = "Closed"
			close = "Closed"
		else
			opening_string = week_hash[day].split(" - ")[0]
			t = Chronic.parse(opening_string)
			open = t.strftime("%H:%M")
			closing_string = week_hash[day].split(" - ")[1]
			p = Chronic.parse(closing_string)
			close = p.strftime("%H:%M")
		end
		self.send("#{day.to_s}_open=", open)
		self.send("#{day.to_s}_close=", close)
		self.save
	end

	def save_weeks_data
		week_hash.each do |day_name, schedule|
			set_times(day_name)
		end
	end

	def current_status
		temp = CheckIfOpen.new(self.id)
		if temp.is_open?
			"Open"
		else
			"Closed"
		end

	end


end