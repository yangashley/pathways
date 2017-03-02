require_relative '../pathway_logic'

describe 'PathwayLogic' do 	
 	describe '#find_possible_domains' do
 		let(:rf_array) { ["K.RF", "1.RF", "2.RF", "3.RF"] }
 		let(:l_array) { ["2.L", "3.L", "4.L", "5.L"] }

 		it 'returns an array of all possible grade levels for a particular domain for a student' do
 			expect(PathwayLogic.find_possible_domains("2.RF", rf_array)).to eq ["2.RF", "3.RF"]
 		end

 		it 'returns an array of all possible grade levels for a domain if student test data is lower than the starting grade for the domain' do
 			expect(PathwayLogic.find_possible_domains("K.L", l_array)).to eq ["2.L", "3.L", "4.L", "5.L"]
 		end
 	end

 	describe '#produce_pathway' do 
 		let(:all_domains_for_pathway) { ["2.RF", "5.L", "3.RL", "K.RI", "3.L", "4.L", "6.L"] }
 		let(:ordered_domains_array) { ["K.RF", "K.RL", "K.RI", "1.RF", "1.RL", "1.RI", "2.RF", "2.RI", "2.RL", "2.L", "3.RF", "3.RL", "3.RI", "3.L", "4.RI", "4.RL", "4.L", "5.RI", "5.RL", "5.L", "6.RI", "6.RL"] }

 		it 'returns an array with 5 or less domains' do
 			expect(PathwayLogic.produce_pathway(ordered_domains_array, all_domains_for_pathway)).to eq ["K.RI", "2.RF", "3.RL", "3.L", "4.L"]
 		end
 	end
end