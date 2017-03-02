require_relative '../app'
require_relative '../domain_parser'
require_relative '../test_parser'

describe 'App' do 
	describe '#build_pathway' do 
		let(:test_data_hash) { TestParser.parse_tests('data/student_tests.csv') }
		let(:all_domains_ordered) { DomainParser.parse_domains('data/domain_order.csv') }
		let(:student_pathways) { build_pathway(test_data_hash, all_domains_ordered) }

		it 'returns a 2D array where the inner arrays are completed learning pathways' do
			expect(student_pathways).to include(["K.RI", "1.RI", "2.RF", "2.RI", "3.RF"])
		end

		it 'returns an array that is the same length as the test data hash' do
			expect(student_pathways.length).to eq test_data_hash.length
		end
	end
end