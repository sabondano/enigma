class Cracker

	attr_reader :index_of_n_in_character_map, :index_of_dot_in_character_map, :index_of_d_in_character_map

	def initialize(message)
		@message = message
		@final_rotations = {}
		@rotation_types_last_four = []
		@character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
		@index_of_n_in_character_map = @character_map.index("n")
		@index_of_d_in_character_map = @character_map.index("d")
		@index_of_dot_in_character_map = @character_map.index(".")
	end

	def validate_final_rotations
		validated_final_rotations = []
		@final_rotations.each do |element|
			if element[0] == "A"
				validated_final_rotations[0] = element[1]
			elsif element[0] == "B"
				validated_final_rotations[1] = element[1]
			elsif element[0] == "C"
				validated_final_rotations[2] = element[1]
			else
				validated_final_rotations[3] = element[1]
			end
		end
		validated_final_rotations
	end

	def get_final_rotations
		@rotation_types_last_four.each_with_index do |rotation_type, index|
			if index == 0
				@final_rotations[rotation_type] = index_fourth_to_last_in_character_map - index_of_n_in_character_map
			elsif index == 1
				@final_rotations[rotation_type] = index_third_to_last_position_in_character_map - index_of_d_in_character_map
			elsif index == 2
				@final_rotations[rotation_type] = index_penultimate_position_in_character_map - index_of_dot_in_character_map
			else
				@final_rotations[rotation_type] = index_last_position_in_character_map - index_of_dot_in_character_map
			end
		end
		@final_rotations
	end

	def rotation_type_n
		if @message.length % 4 == 0
			"A"
		elsif @message.length % 4 == 3
			"D"
		elsif @message.length % 4 == 2
			"C"
		else
			"B"
		end
	end

	def get_last_four_rotation_types
		if rotation_type_n == "A"
			@rotation_types_last_four = ["A", "B", "C", "D"]
		elsif rotation_type_n == "B"
			@rotation_types_last_four = ["B", "C", "D", "A"]
		elsif rotation_type_n == "C"
			@rotation_types_last_four = ["C", "D", "A", "B"]
		else
			@rotation_types_last_four = ["D", "A", "B", "C"]
		end
	end

	def index_fourth_to_last_in_character_map
		@character_map.index(@message[-4])
	end

	def index_third_to_last_position_in_character_map
		@character_map.index(@message[-3])
	end

	def index_penultimate_position_in_character_map
		@character_map.index(@message[-2])
	end

	def index_last_position_in_character_map
		@character_map.index(@message[-1])
	end

end