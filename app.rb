require_relative 'domain_parser'
require_relative 'models/domain'
require_relative 'test_parser'
require_relative 'pathway_logic'
require_relative 'models/pathway'
require_relative 'pathway_writer'

def generate_all_domains(all_domains_ordered, domain)
	all_grades = Domain.new(domain).all_grades_in_domain(all_domains_ordered)
	PathwayLogic.find_possible_domains(domain, all_grades)
end

def build_pathway(student_data, all_domains_ordered)
	final_pathways = Array.new
	student_data.each do |student, test_scores|
		entire_student_pathway = Array.new
		test_scores.each do |domain|
			entire_student_pathway << generate_all_domains(all_domains_ordered, domain)
		end
		final_pathways << PathwayLogic.produce_pathway(all_domains_ordered, entire_student_pathway.flatten.compact)
	end
	final_pathways
end

def create_pathways(student_data, all_final_pathways)
	all_pathways = Array.new
	student_data.keys.each.with_index do |student_name, index|
		all_pathways << Pathway.new(student_name, all_final_pathways[index])
	end
	all_pathways
end

def generate_learning_paths_file(test_data_file, domain_order_file, results_file)
	test_data = TestParser.parse_tests(test_data_file)
	all_domains_ordered = DomainParser.parse_domains(domain_order_file)

	generated_pathways = build_pathway(test_data, all_domains_ordered)
	pathways = create_pathways(test_data, generated_pathways)
	PathwayWriter.write_to_csv(results_file, pathways)
end

generate_learning_paths_file('data/student_tests.csv', 'data/domain_order.csv', 'data/student_pathways.csv')

		