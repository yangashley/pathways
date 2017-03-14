module PathwayLogic
	def self.find_possible_domains(domain, domain_array)
		all_grades_for_domain = domain_array.map {|grade_level| grade_level[0]}
		all_espark_grades = ["K", "1", "2", "3", "4", "5", "6"]

		if !domain_array.include?(domain)		
			grade = domain.split(".")[0]
			last_grade_in_domain = all_grades_for_domain.last
			return domain_array if all_espark_grades.index(grade) < all_espark_grades.index(last_grade_in_domain)
		else
			domain_array[domain_array.index(domain)..-1]
		end
	end 	

	def self.produce_pathway(ordered_domains_array, all_domains_for_pathway)
		(ordered_domains_array & all_domains_for_pathway).first(5)
	end
end

