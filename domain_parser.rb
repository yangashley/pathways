require 'csv'

module DomainParser
	def self.parse(filename)
		domain_order_hash = {}
		CSV.foreach(filename) do |row|
			domain_order_hash[row[0]] = row[1..-1]
		end
		domain_order_hash
	end
end


# parse domains into one big array of all possible domains
# then when you check the missions a student needs for learning pathway, you can start getting rid of the ones that don't apply and be left the ones needed
# ["K.RF","K.RL","K.RI", "1.RF","1.RL","1.RI" ...]

# currently .parse does this
# domain_data = DomainParser.parse('data/domain_order.csv') 
# domain_data = {"K"=>["RF", "RL", "RI"], "1"=>["RF", "RL", "RI"], "2"=>["RF", "RI", "RL", "L"], "3"=>["RF", "RL", "RI", "L"], "4"=>["RI", "RL", "L"], "5"=>["RI", "RL", "L"], "6"=>["RI", "RL"]}