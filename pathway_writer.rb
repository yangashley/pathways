require 'csv'

module PathwayWriter
	def self.write_to_csv(filename, pathways)
		CSV.open(filename, "w") do |csv|
			pathways.each do |pathway|
			  csv << [pathway.student_name, pathway.goal_domains].flatten(1)
			end
		end
	end
end
