require 'csv'

module TestParser
	def self.parse(filename)
		test_data_array = []
		CSV.foreach(filename, headers: true) do |row|
			test_data_array << row.to_hash
		end
		test_data_array
	end

	def self.parse_tests(filename)
		data_without_headers = CSV.read(filename)
		all_headers = data_without_headers.shift
		test_domains = all_headers[1..-1]

		student_data = {}
		data_without_headers.map do |student|
			student_name = student.shift	
			student_domains = student.map.with_index do |grade, index| 
				"#{grade}.#{test_domains[index]}"
			end
			student_data.store(student_name, student_domains) 
		end
		student_data
	end

	def self.prepare_data_for_pathways(filename)
		unsupported_domains = ["K.L", "1.L", "4.RF", "5.RF", "6.RF", "6.L"]		
		
		TestParser.parse_tests(filename).each do |student, test_data|
			student = test_data.delete_if { |domain| unsupported_domains.include?(domain) }
		end
	end
end





