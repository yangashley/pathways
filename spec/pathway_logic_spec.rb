require_relative '../pathway_logic'

describe 'PathwayLogic' do 
  before(:all) do
    @test_data = {"Student Name"=>"Albin Stanton", "RF"=>"2", "RL"=>"3", "RI"=>"K", "L"=>"3"} 
	end

	describe '#convert_letter_k_to_zero' do 
	  it 'returns a hash where any values of K are converted to 0' do
	    expect(PathwayLogic.convert_letter_k_to_zero(@test_data)).to be_a Hash
	  end

	  it 'has a value of 0 instead of K' do
	  	expect(@test_data).to include("RI" => 0)
	  end
 	end

	describe '#lowest_domain' do

	  it 'returns the first lowest_domain from a student test hash' do 
	    expect(PathwayLogic.lowest_domain(@test_data)).to eq "K.RI"
	  end
	end
end