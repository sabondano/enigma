require_relative '../lib/enigma/key_generator'
require_relative '../lib/enigma/offset_calculator'
require_relative '../lib/enigma/decryptor'
require_relative '../lib/enigma/file_reader'
require_relative '../lib/enigma/file_writer'

encrypted_file = ARGV[0]
decrypted_file_name = ARGV[1]
key = ARGV[2]
date = ARGV[3]
key = KeyGenerator.new(key.split(""))
offset = OffsetCalculator.new(date, key)
decryptor = Decryptor.new(offset.all_final_rotations)
file_reader = FileReader.new(encrypted_file)
file_writer = FileWriter.new(decrypted_file_name)
file_writer.write_encryption("#{decryptor.decrypt(file_reader.read_message)}")
cracked_message = decryptor.decrypt(file_reader.read_message)

puts "Created '#{decrypted_file_name}' with the key #{key.number} and date #{date}"
puts "The hidden message is: #{cracked_message}"