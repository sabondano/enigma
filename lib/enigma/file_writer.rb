class FileWriter

	attr_reader :file_name

	def initialize(file_name)
		@file_name = file_name
	end

	def write_encryption(encryption)
		if File.exist?(file_name)
			puts "WARNING: A file named #{file_name} already exists. Would you like to overwrite it? (y/n)"
			overwrite = $stdin.gets.chomp

			if overwrite == "y"
				file = File.open("#{file_name}", 'w')
				file.write(encryption)
				file.close
			else
				puts "Try again with a different file name. Bye!"
				exit
			end

		else
			file = File.open("#{file_name}", 'w')
			file.write(encryption)
			file.close
		end
	end

end