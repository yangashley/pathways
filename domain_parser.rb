require 'csv'

module DomainParser
	def self.parse_domains(filename)
	  ordered_domains = []
	  CSV.foreach(filename) do |row|
	    domain = row.shift
	    ordered_domains << row.map {|elem| "#{domain}.#{elem}"}
	  end
	  ordered_domains.flatten
	end
end


