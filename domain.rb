class Domain
	attr_accessor :domain_name
	def initialize(domain_name)
		@domain_name = domain_name.split(".")[-1]
	end

	def all_grades_in_domain(array_of_all_domains)
		all_grades = Array.new
		@domain_name = @domain_name.split(".")[-1]
		array_of_all_domains.each do |elem|
			if elem.split(".")[-1] == @domain_name
				all_grades << elem
			end
		end 
		all_grades
	end
end