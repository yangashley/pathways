require_relative 'domain_parser'
require_relative 'test_parser'
require_relative 'pathway_logic'
require_relative 'pathway'
require_relative 'pathway_writer'

def generate_all_possible_grades(all_domains_ordered, domain)
	domain = domain.split(".")[-1]
	DomainParser.all_grades_in_domain(all_domains_ordered, domain)
end

def generate_all_domains(all_domains_ordered, domain)
	all_grades = generate_all_possible_grades(all_domains_ordered, domain)
	PathwayLogic.find_possible_domains(domain, all_grades)
end

def build_pathway(student_data_hash, all_domains_ordered)
	final_pathways = Array.new
	student_data_hash.each do |student, test_scores|
		entire_student_pathway = Array.new
		test_scores.each do |domain|
			entire_student_pathway << generate_all_domains(all_domains_ordered, domain)
		end
		final_pathways << PathwayLogic.produce_pathway(all_domains_ordered, entire_student_pathway.flatten.compact)
	end
	final_pathways
end

def create_pathways(student_data_hash, all_final_pathways)
	all_pathways = Array.new
	student_data_hash.keys.each.with_index do |student_name, index|
		all_pathways << Pathway.new(student_name, all_final_pathways[index])
	end
	all_pathways
end

test_data_hash = TestParser.parse_tests('data/student_tests.csv')
all_domains_ordered = DomainParser.parse_domains('data/domain_order.csv')

generated_pathways = build_pathway(test_data_hash, all_domains_ordered)
pathways = create_pathways(test_data_hash, generated_pathways)
PathwayWriter.write_to_csv('data/student_pathways.csv', pathways)
