module PathwayLogic
	def self.convert_letter_k_to_zero(test_hash)
		test_hash.each do |key, value|
			if value == "K"
				test_hash[key] = 0
			end
		end
		test_hash
	end
end
  