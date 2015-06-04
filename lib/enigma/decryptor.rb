class Decryptor

	attr_reader :final_rotations

	def initialize(final_rotations)
		@final_rotations = final_rotations
		@character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
	end

	def decrypt(hidden_message)
		decryption = []
		hidden_message.split("").each_slice(4) do |set|
			decryption << decrypt_set_of_four(set)
		end
		decryption.join("")
	end

	def decrypt_set_of_four(set)
		decrypted_set = set.map.with_index do |character, index|
			if index == 0
				backward_rotation_a(character)
			elsif index == 1
				backward_rotation_b(character)
			elsif index == 2
				backward_rotation_c(character)
			else
				backward_rotation_d(character)
			end
		end
		decrypted_set.join("")
	end

	def backward_rotation_a(character)
		original_index = @character_map.index(character)
		new_index = original_index - final_rotations[0]
		@character_map.rotate(new_index)[0]
	end

	def backward_rotation_b(character)
		original_index = @character_map.index(character)
		new_index = original_index - final_rotations[1]
		@character_map.rotate(new_index)[0]
	end

	def backward_rotation_c(character)
		original_index = @character_map.index(character)
		new_index = original_index - final_rotations[2]
		@character_map.rotate(new_index)[0]
	end

	def backward_rotation_d(character)
		original_index = @character_map.index(character)
		new_index = original_index - final_rotations[3]
		@character_map.rotate(new_index)[0]
	end


end