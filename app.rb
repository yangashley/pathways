require_relative 'domain_parser'
require_relative 'test_parser'
require_relative 'pathway_logic'
require_relative 'pathway'



test_data = TestParser.parse('data/student_tests.csv')
domain_data = DomainParser.parse('data/domain_order.csv') 

pathways = []
test_data.each do |student_hash|
	pathways << Pathway.new(student_hash["Student Name"])
end 

# convert all 'K's to 0
converted_data = test_data.each do |student_data_hash|
	PathwayLogic.convert_letter_k_to_zero(student_data_hash)
end

# find the lowest domains for each student, returns an array of hashes with no names
lowest_domains = []
converted_data.each do |student_data_hash|
	lowest_domains << PathwayLogic.find_lowest_domains(student_data_hash)
end

first_domains = []
lowest_domains.each do |student_data_hash|
	first_domains << PathwayLogic.starting_domain(student_data_hash, domain_data)
end






# if first_domains has value "K.L, 1.L, 6.L", then don't add this into a student's learning pathway because the array of domain_data hashes don't contain these values
