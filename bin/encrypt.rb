require_relative '../lib/enigma/key_generator'
require_relative '../lib/enigma/offset_calculator'

message_file = ARGV[0]
encryption_file = ARGV[1]
today = Time.new.strftime("%d%m%y")
key = KeyGenerator.new
key.generate_key
offset = OffsetCalculator.new(today, key)
encryptor = Encryptor.new(message, final_rotations)


puts "Created '#{encryption_file}' with the key #{key.number} and date #{today}"
