module PathwayLogic
	def self.find_possible_domains(domain, domain_array)
		all_possible_grades = ["K", "1", "2", "3", "4", "5", "6"]

		if !domain_array.include?(domain)		
			grade = domain.split(".")[0]
			domain = domain.split(".")[-1]
			last_grade_in_domain = all_possible_grades.last
			if all_possible_grades.index(grade) <= all_possible_grades.index(last_grade_in_domain)
				domain_array
			end
		else
			domain_array[domain_array.index(domain)..-1]
		end
	end 	

	def self.produce_pathway(ordered_domains_array, all_domains_for_pathway)
		(ordered_domains_array & all_domains_for_pathway).first(5) 
	end
end
