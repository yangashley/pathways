require 'csv'

module DomainParser
	def self.parse(filename)
		domain_order_hash = {}
		CSV.foreach(filename) do |row|
			domain_order_hash[row[0]] = row[1..-1]
		end
		domain_order_hash
	end

	def self.parse_domains(filename)
	  ordered_domains = []
	  CSV.foreach(filename) do |row|
	    domain = row.shift
	    ordered_domains << row.map {|elem| "#{domain}.#{elem}"}
	  end
	  ordered_domains.flatten
	end
end
