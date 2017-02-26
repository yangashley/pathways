require 'csv'

module TestParser
	def self.parse(filename)
		test_data_array = []
		CSV.foreach(filename, headers: true) do |row|
			test_data_array << row.to_hash
		end
		test_data_array
	end
end

