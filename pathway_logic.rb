module PathwayLogic
	def self.convert_letter_k_to_zero(test_hash)
		test_hash.each do |key, value|
			if value == "K"
				test_hash[key] = "0"
			end
		end
		test_hash
	end

	# def self.lowest_domain(test_hash)
	# 	lowest_grade = 0
	# 	test_hash.each do |key, value|
	# 		if 
	# 		end
	# 	end
	# end
end
  
