class Pathway
	attr_reader :student_name, :goal_domains
	
	def initialize(args)
		@student_name = args.fetch(:student_name)
		@goal_domains = args.fetch(:goal_domains)
	end
end