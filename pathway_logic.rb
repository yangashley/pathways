module PathwayLogic
	def self.find_possible_domains(domain, domain_array)
		if !domain_array.include?(domain)		
			grade = domain.split(".")[0].to_i
			domain = domain.split(".")[-1]
			last_grade_in_domain = domain_array.last.split(".")[0].to_i
			if grade <= last_grade_in_domain
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
