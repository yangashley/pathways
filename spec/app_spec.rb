require_relative '../app'

describe 'App' do 
	describe '#add_first_domain_to_pathway' do 
		let(:pathways) {[Pathway.new("Ron Weaseley"), Pathway.new("Harry Potter")]}
		let(:first_domains) {["2.RI", "1.RF"]}

		it 'returns an array of Pathway objects' do
			expect(add_first_domain_to_pathway(pathways, first_domains)).to be_an Array
		end

		it 'adds the first domain to the goal domains for a pathway' do
			updated_pathways = add_first_domain_to_pathway(pathways, first_domains)
			expect(updated_pathways.first.goal_domains.first).to eq "2.RI"
		end
	end
end