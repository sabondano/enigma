require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/enigma/cracker'

class CrackerTest < Minitest::Test
	def test_it_finds_the_correct_rotation_type_for_the_letter_n_given_a_file_that_ends_in_the_given_tip
		message = "test..end.."
		cracker = Cracker.new(message)
		rotation_type_for_n = cracker.rotation_type_n

		assert_equal "D", rotation_type_for_n
	end

	def test_it_finds_correct_rotation_type_for_the_the_last_four_characters_of_message
		message = "test..end.."
		cracker = Cracker.new(message)
		rotation_type_for_n = cracker.rotation_type_n
		rotation_types_last_four_characters = cracker.get_last_four_rotation_types

		assert_equal ["D", "A", "B", "C"], rotation_types_last_four_characters
	end

	def test_it_finds_difference_between_fourth_to_last_char_in_message_and_n
		message = "test..end.."
		cracker = Cracker.new(message)
		difference = cracker.index_fourth_to_last_in_character_map - cracker.index_of_n_in_character_map

		assert_equal 0, difference
	end

	def test_it_finds_difference_between_fourth_to_last_char_in_longer_message_and_n
		message = "prnimgua698t3qye79qb3t9 8dqm79 sxmw p92irq4stq.ird8 pqshxsuc8t7eo9yvt93o8hses9q rn2m3mnpps9e6mo.tmt.n"
		cracker = Cracker.new(message)
		difference = cracker.index_fourth_to_last_in_character_map - cracker.index_of_n_in_character_map

		assert_equal -1, difference
	end

	def test_it_can_get_all_final_rotations_correctly
		message = "prnimgua698t3qye79qb3t9 8dqm79 sxmw p92irq4stq.ird8 pqshxsuc8t7eo9yvt93o8hses9q rn2m3mnpps9e6mo.tmt.n"
		cracker = Cracker.new(message)
		cracker.get_last_four_rotation_types

		assert_equal ({"B"=>-1, "C"=>16, "D"=>0, "A"=>-24}), cracker.get_final_rotations
	end

	def test_it_can_arrange_final_rotations_in_array_starting_with_A_and_sorted_alphabetically
		message = "prnimgua698t3qye79qb3t9 8dqm79 sxmw p92irq4stq.ird8 pqshxsuc8t7eo9yvt93o8hses9q rn2m3mnpps9e6mo.tmt.n"
		cracker = Cracker.new(message)
		cracker.get_last_four_rotation_types
		cracker.get_final_rotations
		final_rotations = cracker.validate_final_rotations

		assert_equal [-24, -1, 16, 0], final_rotations

	end


end