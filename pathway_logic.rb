module PathwayLogic
	def self.find_possible_domains(domain, domain_array)
		# read domain_order.csv to create an array of all grade levels 
		grades_for_espark = ["PK", "K", "1", "2", "3", "4", "5", "6"]
		grades_in_domain = domain_array.map {|domain| domain[0] }
		
		if !domain_array.include?(domain)		
			grade = domain.split(".")[0]
			last_grade_in_domain = grades_in_domain.last.split(".")[0]
			if grades_for_espark.index(grade) <= grades_for_espark.index(last_grade_in_domain)
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

