require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/enigma/file_reader'

class FileReaderTest < Minitest::Test

	def test_it_can_take_in_the_input_file_name
		filereader = FileReader.new("message.txt")

		assert_equal "message.txt", filereader.filename
	end

	def test_it_it_can_read_the_test_in_the_file_name_to_a_string
		filereader = FileReader.new("#{Dir.pwd}/test/enigma/message_test.txt")

		assert_equal "this is the secret message", filereader.read_message
	end
end