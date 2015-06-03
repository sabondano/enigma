require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/enigma/encryptor'
require_relative '../../lib/enigma/key_generator'
require_relative '../../lib/enigma/offset_calculator'

class EncryptorTest < Minitest::Test
	
	def test_it_has_all_final_rotations_from_the_start
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		encryptor = Encryptor.new(offset.all_final_rotations)

		assert encryptor.final_rotations
	end

	def test_it_has_an_encrypt_method
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		encryptor = Encryptor.new(offset.all_final_rotations)

		assert encryptor.respond_to?(:encrypt)
	end

	def test_forward_rotation_A_rotates_character_forward_by_the_A_final_rotation
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		encryptor = Encryptor.new(offset.all_final_rotations)
		encryption = encryptor.forward_rotation_a("s")

		assert_equal "3", encryption
	end

	def test_forward_rotation_B_rotates_character_forward_by_the_B_final_rotation
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		encryptor = Encryptor.new(offset.all_final_rotations)
		encryption = encryptor.forward_rotation_b("e")

		assert_equal "v", encryption
	end

	def test_forward_rotation_C_rotates_character_forward_by_the_C_final_rotation
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		encryptor = Encryptor.new(offset.all_final_rotations)
		encryption = encryptor.forward_rotation_c("c")

		assert_equal "r", encryption
	end

	def test_forward_rotation_D_rotates_character_forward_by_the_D_final_rotation
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		encryptor = Encryptor.new(offset.all_final_rotations)
		encryption = encryptor.forward_rotation_d("r")

		assert_equal "e", encryption
	end

	def test_it_can_encrypt_four_characters_at_a_time_using_all_final_rotations
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		encryptor = Encryptor.new(offset.all_final_rotations)
		encrypted_message = encryptor.encrypt_set_of_four(["s", "e", "c", "r"])

		assert_equal "3vre", encrypted_message
	end
	
	def test_the_encrypt_method_returns_an_encrypted_version_of_the_message
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)
		encryptor = Encryptor.new(offset.all_final_rotations)
		encrypted_message = encryptor.encrypt("secret")

		assert_equal "3vrep ", encrypted_message
	end


end