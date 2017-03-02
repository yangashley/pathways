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

