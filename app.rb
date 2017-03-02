require_relative 'domain_parser'
require_relative 'test_parser'
require_relative 'pathway_logic'
require_relative 'pathway'

test_data_hash = TestParser.parse_tests('data/student_tests.csv')
all_domains_ordered = DomainParser.parse_domains('data/domain_order.csv') 


def generate_all_domains_for_pathway(all_domains_ordered, domain)
	abbreviation = domain.split(".")[-1]
	all_grades = DomainParser.all_grades_in_domain(all_domains_ordered, abbreviation)
	all_grades
	PathwayLogic.find_possible_domains(domain, all_grades)
end

def build_pathway(student_data_hash, all_domains_ordered)
	completed_pathway = Array.new
	student_data_hash.each do |student, test_scores|
		total_pathway = Array.new
		test_scores.each do |domain|
			total_pathway << generate_all_domains_for_pathway(all_domains_ordered, domain)
		end
		completed_pathway << PathwayLogic.produce_pathway(all_domains_ordered, total_pathway.flatten.compact)
	end
	completed_pathway
end

p build_pathway(test_data_hash, all_domains_ordered)

# wrap these sections in their own methods
# lines 11-18 can go in parsing modules
# pathways = test_data.map do |student_hash|
# 	Pathway.new(student_hash["Student Name"])
# end 

# converted_data = test_data.map do |student_data_hash|
# 	PathwayLogic.convert_letter_k_to_zero(student_data_hash)
# end

# # find the lowest domains for each student, returns an array of hashes with no names
# lowest_domains = converted_data.map do |student_data_hash|
# 	PathwayLogic.find_lowest_domains(student_data_hash)
# end

# first_domains = lowest_domains.map do |student_data_hash|
# 	PathwayLogic.starting_domain(student_data_hash, domain_data)
# end

# def add_first_domain_to_pathway(array_of_pathways, array_of_first_domains)
#   i = 0
#   while i < array_of_first_domains.length
#     array_of_pathways[i].add_unit_to_goal_domains(array_of_first_domains[i])
#     i += 1
#   end
#   array_of_pathways
# end

# add_first_domain_to_pathway(pathways, first_domains)


# Adding domains to group of goal domains for pathway
	# while the length of the pathway is less than 5, check all other domains for the current grades to see if another domain from that grade needs to be added
		# IF the grade level and domain are in the test data array, then that domain is added to goal domains
		# IF the domain is needed to progress to the next grade level (need to complete 2.RI before working on 3.RF), then add the domain to goal domains 
		# IF there is is no data for a grade level, then add domains as they appear in the domain order
			# Then increment current grade by 1 


  


