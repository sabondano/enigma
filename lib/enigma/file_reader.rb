class FileReader

	attr_reader :filename

	def initialize(filename)
		@filename = filename
	end

	def read_message
		file = File.open(filename, 'r')
		message = file.read
		file.close
		message
	end

end
