require 'pry'

class Encryptor

	attr_reader :final_rotations

	def initialize(final_rotations)
		@final_rotations = final_rotations
		@character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
	end

	def encrypt(message)
		encryption = []
		message.split("").each_slice(4) do |set|
			encryption << encrypt_set_of_four(set)
		end
		encryption.join("")
	end

	def encrypt_set_of_four(set)
		encrypted_set = set.map.with_index do |character, index|
			if index == 0
				forward_rotation_a(character)
			elsif index == 1
				forward_rotation_b(character)
			elsif index == 2
				forward_rotation_c(character)
			else
				forward_rotation_d(character)
			end
		end
		encrypted_set.join("")
	end

	def forward_rotation_a(character)
		original_index = @character_map.index(character)
		new_index = original_index + final_rotations[0]
		@character_map.rotate(new_index)[0]
		end

	def forward_rotation_b(character)
		original_index = @character_map.index(character)
		new_index = original_index + final_rotations[1]
		@character_map.rotate(new_index)[0]
	end

	def forward_rotation_c(character)
		original_index = @character_map.index(character)
		new_index = original_index + final_rotations[2]
		@character_map.rotate(new_index)[0]
	end

	def forward_rotation_d(character)
		original_index = @character_map.index(character)
		new_index = original_index + final_rotations[3]
		@character_map.rotate(new_index)[0]
	end


end
