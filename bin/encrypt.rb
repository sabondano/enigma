message_file = ARGV[0]
encryption_file = ARGV[1]
today = Time.new.strftime("%d%m%y")
key = KeyGenerator.new

puts "Created '#{encryption_file}' with the key 82648 and date #{today}"
