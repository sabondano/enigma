require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/enigma/offset_calculator'
require_relative '../../lib/enigma/key_generator'
require 'pry'

class OffsetCalculatorTest < Minitest::Test
	def test_it_has_a_date_from_the_start
		offset = OffsetCalculator.new("020315", 41521)

		assert offset.date
		assert_equal 20315, offset.date
	end

	def test_it_has_a_key_from_the_start
		offset = OffsetCalculator.new("020315", 41521)

		assert offset.key
		assert_equal 41521, offset.key
	end

	def test_the_date_can_only_be_in_numeric_form_in_the_format_DDMMYY
		offset = OffsetCalculator.new("020315", 41521)

		assert offset.date.is_a?(Fixnum)
	end

	def test_it_squares_the_date
		offset = OffsetCalculator.new("020315", 41521)
		date_squared = offset.square_date

		assert_equal 412699225, date_squared
	end

	def test_it_finds_the_last_four_digits_of_the_squared_date
		offset = OffsetCalculator.new("020315", 41521)
		last_four_digits = offset.get_last_four_digits_of_squared_date

		assert_equal 9225, last_four_digits
	end

	def test_the_first_digit_of_the_last_four_numbers_of_the_squared_date_is_the_A_offset
		offset = OffsetCalculator.new("020315", 41521)
		offset_a = offset.offset("A")

		assert_equal 9, offset_a
		end

	def test_the_second_digit_of_the_last_four_numbers_of_the_squared_date_is_the_A_offset
		offset = OffsetCalculator.new("020315", 41521)
		offset_b = offset.offset("B")

		assert_equal 2, offset_b
		end

	def test_the_third_digit_of_the_last_four_numbers_of_the_squared_date_is_the_A_offset
		offset = OffsetCalculator.new("020315", 41521)
		offset_c = offset.offset("C")

		assert_equal 2, offset_c
	end

	def test_the_fourth_digit_of_the_last_four_numbers_of_the_squared_date_is_the_A_offset
		offset = OffsetCalculator.new("020315", 41521)
		offset_d = offset.offset("D")

		assert_equal 5, offset_d
	end
	
	def test_the_final_A_rotation_is_the_sum_of_the_rotation_plus_the_offset
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)

		assert_equal 50, offset.final_a_rotation
	end

		def test_the_final_B_rotation_is_the_sum_of_the_rotation_plus_the_offset
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)

		assert_equal 17, offset.final_b_rotation
	end

		def test_the_final_C_rotation_is_the_sum_of_the_rotation_plus_the_offset
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)

		assert_equal 54, offset.final_c_rotation
	end

		def test_the_final_D_rotation_is_the_sum_of_the_rotation_plus_the_offset
		key = KeyGenerator.new([4, 1, 5, 2, 1])
		offset = OffsetCalculator.new("020315", key)

		assert_equal 26, offset.final_d_rotation
	end


end