require_relative '../lib/enigma/key_generator'
require_relative '../lib/enigma/offset_calculator'
require_relative '../lib/enigma/decryptor'
require_relative '../lib/enigma/file_reader'

encrypted_file = ARGV[0]
date = ARGV[1]
key = ARGV[2]
key = KeyGenerator.new(key.split(""))
offset = OffsetCalculator.new(date, key)
decryptor = Decryptor.new(offset.all_final_rotations)
filereader = FileReader.new(encrypted_file)
cracked_message = decryptor.decrypt(filereader.read_message)

puts "The hidden message is: #{cracked_message}"