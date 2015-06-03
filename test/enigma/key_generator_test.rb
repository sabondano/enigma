require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/enigma/key_generator'
require 'pry'

class KeyGeneratorTest < Minitest::Test
	def test_acceptance
		key = KeyGenerator.new
		key.generate_key

		assert key.number.is_a?(Fixnum)
		assert key.number.to_s.length == 5


		key = KeyGenerator.new([4, 1, 5, 2, 1])

		assert_equal 41, key.rotation("A")
		assert_equal 15, key.rotation("B")
		assert_equal 52, key.rotation("C")
		assert_equal 21, key.rotation("D")
	end

	def test_it_generates_a_number
		key = KeyGenerator.new
		key.generate_number

		assert key.number.is_a?(Fixnum)
	end

	def test_it_generates_key_of_five_digits
		key = KeyGenerator.new
		key.generate_key

		assert key.number.to_s.length == 5
	end

	def test_it_generates_different_keys
		key_1 = KeyGenerator.new
		key_2 = KeyGenerator.new
		key_1.generate_key
		key_2.generate_key


		refute key_1.number == key_2.number
	end

end