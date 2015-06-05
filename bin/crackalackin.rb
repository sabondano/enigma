require_relative '../lib/enigma/key_generator'
require_relative '../lib/enigma/offset_calculator'
require_relative '../lib/enigma/decryptor'
require_relative '../lib/enigma/file_reader'
require_relative '../lib/enigma/file_writer'
require_relative '../lib/enigma/cracker'

encrypted_file = ARGV[0]
cracked_file_name = ARGV[1]

file_reader = FileReader.new(encrypted_file)
hidden_message = file_reader.read_message

cracker = Cracker.new(hidden_message)
cracker.get_last_four_rotation_types
cracker.get_final_rotations
final_rotations = cracker.validate_final_rotations

decryptor = Decryptor.new(final_rotations)
file_writer = FileWriter.new(cracked_file_name)
file_writer.write_encryption("#{decryptor.decrypt(file_reader.read_message)}")
cracked_message = decryptor.decrypt(file_reader.read_message)

puts "Created '#{cracked_file_name}'"
puts "The hidden message is: #{cracked_message}"

