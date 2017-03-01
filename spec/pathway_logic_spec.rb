require_relative '../pathway_logic'

describe 'PathwayLogic' do 
  before(:all) do
    @test_data = {"Student Name"=>"Albin Stanton", "RF"=>"2", "RL"=>"3", "RI"=>"K", "L"=>"3"} 
    @parsed_domains = {"K"=>["RF", "RL", "RI"], "1"=>["RF", "RL", "RI"], "2"=>["RF", "RI", "RL", "L"], "3"=>["RF", "RL", "RI", "L"], "4"=>["RI", "RL", "L"], "5"=>["RI", "RL", "L"], "6"=>["RI", "RL"]}
	end

	describe '#convert_letter_k_to_zero' do 
	  it 'returns a hash where any values of K are converted to 0' do
	    expect(PathwayLogic.convert_letter_k_to_zero(@test_data)).to be_a Hash
	  end

	  it 'has a value of 0 instead of K' do
	  	expect(@test_data).to include("RI" => "0")
	  end
 	end

 	describe '#find_lowest_grade' do 
 		it 'returns the lowest grade as an integer' do
 			expect(PathwayLogic.find_lowest_grade(@test_data)).to eq 0
 		end
 	end

 	describe '#find_lowest_domains' do 
 		let(:test_hash) { {"Student Name"=>"Cat Nap", "RF"=>"2", "RL"=>"3", "RI"=>"K", "L"=>"3"} }

 		it 'returns a hash of lowest domains according to student test data' do 
	    expect(PathwayLogic.find_lowest_domains(test_hash)).to be_a Hash
 		end	

 		it 'returns a hash with with the domains as keys and grade levels as values' do 
	    expect(PathwayLogic.find_lowest_domains(@test_data)).not_to include("Student Name"=>"Albin Stanton")
 		end	
 	end

 	describe '#lowest_grade_domain_order' do 
 		it 'returns an array of domains in correct learning order for the lowest grade level' do 
	    expect(PathwayLogic.lowest_grade_domain_order(@test_data, @parsed_domains)).to be_an Array
 		end		
 	end 	

 	describe '#starting_domain' do 
 		it 'returns the first domain a student should start working on as a string according to test data and domain order' do
 			lowest_domains_hash = PathwayLogic.find_lowest_domains(@test_data)
	    expect(PathwayLogic.starting_domain(lowest_domains_hash, @parsed_domains)).to eq "0.RI"
 		end		
 	end 

 	describe '#find_domains_for_grade' do 
 		let(:test_hash) { {"RF"=>"0", "RL"=>"0", "RI"=>"4", "L"=>"3"} }

 		it 'returns the next domain(s) for a learning path in an array' do 
 			current_domain = "0.RF"
 			expect(PathwayLogic.find_domains_for_grade(current_domain, @parsed_domains, test_hash)).to eq ["0.RL"]
 		end
 	end	

 	describe '#find_possible_domains' do
 		let(:rf_array) { ["K.RF", "1.RF", "2.RF", "3.RF"] }

 		it 'returns an array of all possible grade levels for a particular domain for a student' do
 			expect(PathwayLogic.find_possible_domains("2.RF", rf_array)).to eq ["2.RF", "3.RF"]
 		end
 	end
end