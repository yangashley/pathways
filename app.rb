require_relative 'domain_parser'
require_relative 'test_parser'
require_relative 'pathway_logic'


test_data = TestParser.parse('data/student_tests.csv')
domain_data = DomainParser.parse('data/domain_order.csv') 

# convert all 'K's to 0
converted_data = test_data.each do |student_data_hash|
	PathwayLogic.convert_letter_k_to_zero(student_data_hash)
end

# find the lowest domains for each student, returns an array of hashes with no names
lowest_domains = []
converted_data.each do |student_data_hash|
	lowest_domains << PathwayLogic.find_lowest_domains(student_data_hash)
end

# p lowest_domains
# [{"RI"=>"0"}, {"RL"=>"1", "RI"=>"1", "L"=>"1"}, {"RF"=>"0", "RL"=>"0"}, {"RF"=>"2"}, {"RI"=>"0"}, {"RI"=>"1", "L"=>"1"}, {"RI"=>"0"}, {"RF"=>"0", "RL"=>"0"}, {"RI"=>"0"}, {"RL"=>"3", "L"=>"3"}, {"RF"=>"0", "RI"=>"0"}, {"RF"=>"0"}, {"RI"=>"2"}, {"L"=>"0"}, {"RF"=>"0"}, {"RI"=>"1"}, {"L"=>"0"}, {"RF"=>"0", "RI"=>"0"}, {"RF"=>"0"}, {"L"=>"2"}, {"RL"=>"0", "RI"=>"0"}, {"RF"=>"0"}, {"RF"=>"2", "RI"=>"2"}, {"L"=>"1"}, {"L"=>"0"}, {"RL"=>"0", "L"=>"0"}, {"RF"=>"0", "RL"=>"0"}, {"L"=>"1"}, {"RF"=>"0"}, {"RF"=>"0"}]

# index doesn't work
# something is becoming NIL
# want it to return "1.RL"
# lowest_domains.each do |student_data_hash|
# 	PathwayLogic.starting_domain(student_data_hash, domain_data)
# end