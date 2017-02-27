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

	
end
  
