class Pathway
	attr_accessor :student_name, :goal_domains
	
	def initialize(student_name, goal_domains = [])
		@student_name = student_name
		@goal_domains = goal_domains
	end

	def add_unit_to_goal_domains(unit)
		unsupported_domains = ["K.L", "1.L", "6.L"]
		if @goal_domains.length < 5
			if !unsupported_domains.include?(unit)
			  @goal_domains << unit               
			end
		end
	end

end