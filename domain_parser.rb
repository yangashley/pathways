require 'csv'

module DomainParser
	def self.parse(filename)
		domain_order_hash = {}
		CSV.foreach(filename) do |row|
			domain_order_hash[row[0]] = row[1..-1]
		end
		domain_order_hash.select{|grade, domain| grade =="K"}
	end
end
