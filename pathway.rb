class Pathway
	attr_accessor :student_name, :goal_domains
	
	def initialize(student_name, goal_domains = [])
		@student_name = student_name
		@goal_domains = goal_domains
	end
end