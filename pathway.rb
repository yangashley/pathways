class Pathway
	attr_accessor :student_name, :goal_domains
	
	# def initialize(args)
	# 	@student_name = args.fetch(:student_name)
	# 	@goal_domains = args.fetch(:goal_domains), []
	# end

	def add_unit_to_goal_domains(unit)
		if @goal_domains.length < 5
      @goal_domains << unit               
    end
	end
end