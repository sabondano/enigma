require_relative '../lib/enigma/key_generator'
require_relative '../lib/enigma/offset_calculator'
require_relative '../lib/enigma/encryptor'
require_relative '../lib/enigma/file_reader'

message_file = ARGV[0]
encryption_file = ARGV[1]
today = Time.new.strftime("%d%m%y")
key = KeyGenerator.new
key.generate_key
offset = OffsetCalculator.new(today, key)
encryptor = Encryptor.new(offset.all_final_rotations)
filereader = FileReader.new(message_file)
puts encryptor.encrypt(filereader.read_message)



puts "Created '#{encryption_file}' with the key #{key.number} and date #{today}"
