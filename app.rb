require_relative 'domain_parser'
require_relative 'test_parser'
require_relative 'pathway_logic'
require_relative 'pathway'

test_data = TestParser.parse('data/student_tests.csv')
domain_data = DomainParser.parse('data/domain_order.csv') 

# wrap these sections in their own methods
pathways = []
test_data.each do |student_hash|
	pathways << Pathway.new(student_hash["Student Name"])
end 

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

def add_first_domain_to_pathway(array_of_pathways, array_of_first_domains)
  i = 0
  while i < array_of_first_domains.length
    array_of_pathways[i].add_unit_to_goal_domains(array_of_first_domains[i])
    i += 1
  end
  array_of_pathways
end

add_first_domain_to_pathway(pathways, first_domains)

# Adding domains to group of goal domains for pathway
	# while the length of the pathway is less than 5, check all other domains for the current grades to see if another domain from that grade needs to be added
		# IF the grade level and domain are in the test data array, then that domain is added to goal domains
		# IF the domain is needed to progress to the next grade level (need to complete 2.RI before working on 3.RF), then add the domain to goal domains 
		# IF there is is no data for a grade level, then add domains as they appear in the domain order
			# Then increment current grade by 1 

	# Needs a condition so that looping stops if goal domains does not have 5 units and all grades have been checked
  


