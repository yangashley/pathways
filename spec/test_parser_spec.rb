require_relative '../test_parser'

describe TestParser do

  before(:all) do
    @test_data = TestParser.parse('data/student_tests.csv')
	end
  it 'should return an array of hashes' do
    expect(@test_data).to be_an Array
  end

  context "hashes in the array" do
    it 'have a student name for the value of the first key-value pair' do 
    	test_hash = @test_data[0]
    	expect(test_hash[0]).to eq "Albin Stanton"
  	end

	  it 'have a grade level for the value of any key-value pair excluding the first one' do 
	  	expect(test_hash[1]). to eq "2"
	  end
  end

end		  

