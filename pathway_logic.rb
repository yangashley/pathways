module PathwayLogic
	def self.convert_letter_k_to_zero(test_hash)
		test_hash.each do |key, value|
			if value == "K"
				test_hash[key] = "0"
			end
		end
		test_hash
	end

	def self.find_lowest_grade(test_hash)
		test_hash.values.min.to_i
	end

	def self.find_lowest_domains(test_hash)
		test_data = test_hash
	  test_data.shift
		test_data.select do |domain, grade|
	    grade.to_i == PathwayLogic.find_lowest_grade(test_hash)
	  end
	end

	def self.lowest_grade_domain_order(test_hash, domain_order)
	  lowest_grade = PathwayLogic.find_lowest_grade(test_hash)
	  if lowest_grade != 0
	    domain_order[lowest_grade.to_s]
	   else
	     domain_order["K"]
	   end
	end	

	def self.starting_domain(test_hash, domain_order)
	first_domain = ""
	key = test_hash.keys.first
	  if test_hash.length == 1
	  	first_domain += "#{test_hash[key]}.#{key}" 
	  else
	    domain_indices = []
      ordered_domains = PathwayLogic.lowest_grade_domain_order(test_hash, domain_order)
      test_hash.keys.each do |domain|
        domain_indices << ordered_domains.index(domain)
      end
      domain_position = domain_indices.compact.min
      first_domain += "#{test_hash[key]}.#{ordered_domains[domain_position]}"
    end
    first_domain
	end

	# takes domains from the goal_domain array of a Pathway
	def self.find_domains_for_grade(goal_domain, domain_order, test_hash)
		grade_domain = goal_domain.split(".")
		current_level = grade_domain[0]
		current_domain = grade_domain[-1]
		next_goal = []

		if current_level != "0"
	    possible_domains = domain_order[current_level]
	  else
	    possible_domains = domain_order["K"]
	  end
	  possible_domains.each do |domain|
	  	if domain != current_domain
	  		if current_level >= test_hash[domain]
	 	  		next_goal << "#{current_level}.#{domain}"
	  		end
	  	end
	  end
	  next_goal
	end

	def self.find_possible_domains(domain, domain_array)
		domain_array[domain_array.index(domain)..-1]
	end 

	def self.produce_pathway(ordered_domains_array, all_domains_for_pathway)
		(ordered_domains_array & all_domains_for_pathway).first(5) 
	end
end
