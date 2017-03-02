require_relative 'domain_parser'
require_relative 'test_parser'
require_relative 'pathway_logic'
require_relative 'pathway'

test_data_hash = TestParser.parse_tests('data/student_tests.csv')
all_domains_ordered = DomainParser.parse_domains('data/domain_order.csv') 

def generate_all_possible_grades(all_domains_ordered, domain)
	domain = domain.split(".")[-1]
	DomainParser.all_grades_in_domain(all_domains_ordered, domain)
end

def generate_all_domains(all_domains_ordered, domain)
	all_grades = generate_all_possible_grades(all_domains_ordered, domain)
	PathwayLogic.find_possible_domains(domain, all_grades)
end

def build_pathway(student_data_hash, all_domains_ordered)
	final_pathway = Array.new
	student_data_hash.each do |student, test_scores|
		entire_pathway = Array.new
		test_scores.each do |domain|
			entire_pathway << generate_all_domains(all_domains_ordered, domain)
		end
		final_pathway << PathwayLogic.produce_pathway(all_domains_ordered, entire_pathway.flatten.compact)
	end
	final_pathway
end

def create_pathways(student_data_hash, all_final_pathways)
	all_pathways = Array.new
	student_data_hash.keys.each.with_index do |student_name, index|
		all_pathways << Pathway.new(student_name, all_final_pathways[index])
	end
	all_pathways
end

