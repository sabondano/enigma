require 'minitest/autorun'
require 'minitest/pride'
require_relative '../../lib/enigma/file_writer'

class FileWriterTest < Minitest::Test
	def test_it_can_take_in_the_input_file_name
		filewriter = FileWriter.new("encrypted.txt")

		assert_equal "encrypted.txt", filewriter.file_name
	end

	# def test_it_it_can_write_the_encrypted_string_to_a_file
	# 	filewriter = FileWriter.new("#{Dir.pwd}/test/enigma/encrypted_test.txt")
	# 	filewriter.write_encryption("sjlo")
	# 	file = File.open("#{Dir.pwd}/test/enigma/encrypted_test.txt", 'r')
	# 	encryption = file.read
	# 	file.close
	#
	# 	assert_equal "sjlo", encryption
	# end

end