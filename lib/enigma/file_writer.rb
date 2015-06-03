class FileWriter

	attr_reader :file_name

	def initialize(file_name)
		@file_name = file_name
	end

	def write_encryption(encryption)
		file = File.open("#{file_name}", 'w')
		file.write(encryption)
		file.close
	end

end