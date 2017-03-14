class Domain
	attr_accessor :domain_name
	
	def initialize(domain_name)
		@domain_name = domain_name.split(".")[-1]
	end

	def all_grades_in_domain(array_of_all_domains)
		all_grades = array_of_all_domains.select {|elem| elem.split(".")[-1] == @domain_name}
	end 
end