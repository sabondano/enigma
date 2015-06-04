require_relative '../lib/enigma/key_generator'
require_relative '../lib/enigma/offset_calculator'
require_relative '../lib/enigma/decryptor'
require_relative '../lib/enigma/file_reader'
require_relative '../lib/enigma/file_writer'

encrypted_file = ARGV[0]
cracked_file_name = ARGV[1]
date = ARGV[2]

(0..99999).map do |key|

	key = KeyGenerator.new(sprintf("%05d", key).split(""))
	offset = OffsetCalculator.new(date, key)
	decryptor = Decryptor.new(offset.all_final_rotations)
	file_reader = FileReader.new(encrypted_file)
	cracked_message = decryptor.decrypt(file_reader.read_message)

	if cracked_message[-7..-1] == "..end.."
		file_writer = FileWriter.new(cracked_file_name)
		file_writer.write_encryption(cracked_message)

		puts "Created '#{cracked_file_name}' with the cracked key #{key.number} and date #{date}"
		puts "The hidden message is: #{cracked_message}"
		break
	end

end


