class KeyGenerator

	def initialize(number=[])
		@number = number
	end

	def number
		@number.join.to_s
	end

	def generate_number
		random_number = rand(10)
		@number << random_number
	end

	def generate_key
		5.times { generate_number }
	end

	def rotation(type)
		case type
			when "A"
				@number[0..1].join.to_i
			when "B"
				@number[1..2].join.to_i
			when "C"
				@number[2..3].join.to_i
			when "D"
				@number[3..4].join.to_i
		end
	end

end