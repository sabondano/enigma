require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/enigma/key_generator'
require 'pry'

class KeyGeneratorTest < Minitest::Test

	def test_it_generates_a_number
		key = KeyGenerator.new
		key.generate_number

		refute_equal nil, key.number =~ /\A(0|1|2|3|4|5|6|7|8|9)\Z/
	end

	def test_it_generates_key_of_five_digits
		key = KeyGenerator.new
		key.generate_key

		refute_equal nil, key.number =~ /\A(0|1|2|3|4|5|6|7|8|9){5}\Z/
	end

	def test_it_generates_different_keys
		key_1 = KeyGenerator.new
		key_2 = KeyGenerator.new
		key_1.generate_key
		key_2.generate_key

		refute key_1.number == key_2.number
	end

	def test_rotation_A_returns_the_first_two_digits_of_the_key
		key = KeyGenerator.new([4, 1, 5, 2, 1])

		assert_equal 41, key.rotation("A")
	end

	def test_rotation_B_returns_the_second_and_third_digits_of_the_key
		key = KeyGenerator.new([4, 1, 5, 2, 1])

		assert_equal 15, key.rotation("B")
	end

	def test_rotation_C_returns_the_third_and_fourth_digits_of_the_key
		key = KeyGenerator.new([4, 1, 5, 2, 1])

		assert_equal 52, key.rotation("C")
	end

	def test_rotation_D_returns_the_fourth_and_fifth_digits_of_the_key
		key = KeyGenerator.new([4, 1, 5, 2, 1])

		assert_equal 21, key.rotation("D")
	end

end
