require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/enigma/key_generator'
require_relative '../../lib/enigma/offset_calculator'
require_relative '../../lib/enigma/decryptor'

class DecryptorTest < Minitest::Test
	def test_it_has_all_final_rotation_calculations_from_the_start
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		decryptor = Decryptor.new(offset.all_final_rotations)

		assert decryptor.final_rotations
	end
	
	def test_it_has_a_decrypt_method
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		decryptor = Decryptor.new(offset.all_final_rotations)

		assert decryptor.respond_to?(:decrypt)
	end

	def test_backward_rotation_A_rotates_character_backward_by_the_A_final_rotation
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		decryptor = Decryptor.new(offset.all_final_rotations)
		decryption = decryptor.backward_rotation_a("3")

		assert_equal "s", decryption
	end

	def test_backward_rotation_B_rotates_character_backward_by_the_B_final_rotation
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		decryptor = Decryptor.new(offset.all_final_rotations)
		decryption = decryptor.backward_rotation_b("v")

		assert_equal "e", decryption
	end

	def test_backward_rotation_C_rotates_character_backward_by_the_C_final_rotation
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		decryptor = Decryptor.new(offset.all_final_rotations)
		decryption = decryptor.backward_rotation_c("r")

		assert_equal "c", decryption
	end

	def test_backward_rotation_D_rotates_character_backward_by_the_D_final_rotation
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		decryptor = Decryptor.new(offset.all_final_rotations)
		decryption = decryptor.backward_rotation_d("e")

		assert_equal "r", decryption
	end

	def test_it_can_decrypt_four_characters_at_a_time_using_all_final_rotations
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		decryptor = Decryptor.new(offset.all_final_rotations)
		decrypted_message = decryptor.decrypt_set_of_four(["3", "v", "r","e"])

		assert_equal "secr", decrypted_message
	end

	def test_the_decrypt_method_returns_a_decrypted_version_of_the_message_correctly
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		decryptor = Decryptor.new(offset.all_final_rotations)
		decrypted_message = decryptor.decrypt("3vrep ")

		assert_equal "secret", decrypted_message
	end
end