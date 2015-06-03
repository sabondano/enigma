class OffsetCalculator

	attr_reader :date, :key

	def initialize(date, key)
		@date = date.to_i
		@key = key
	end

	def square_date
		date ** 2
	end

	def get_last_four_digits_of_squared_date
		square_date.to_s.split("")[-4..-1].join.to_i
	end

	def offset(type)
		last_four_digits = get_last_four_digits_of_squared_date.to_s
		case type
			when "A"
				last_four_digits[0].to_i
			when "B"
				last_four_digits[1].to_i
			when "C"
				last_four_digits[2].to_i
			when "D"
				last_four_digits[3].to_i
		end
	end

	def final_a_rotation
		key.rotation("A") + offset("A")
	end

	def final_b_rotation
		key.rotation("B") + offset("B")
	end

	def final_c_rotation
		key.rotation("C") + offset("C")
	end

	def final_d_rotation
		key.rotation("D") + offset("D")
	end

	def all_final_rotations
		final_rotations = []
		final_rotations << final_a_rotation
		final_rotations << final_b_rotation
		final_rotations << final_c_rotation
		final_rotations << final_d_rotation
		final_rotations
	end

end