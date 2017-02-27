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
		test_hash.values.min
	end

	def self.find_lowest_domains(test_hash)
		test_hash.select do |domain, grade|
	    grade == PathwayLogic.find_lowest_grade(test_hash)
	  end
	end

	
	# def self.lowest_domain(test_hash)
	# 	lowest_grade = 0
	# 	test_hash.each do |key, value|
	# 		if 
	# 		end
	# 	end
	# end
end
  
