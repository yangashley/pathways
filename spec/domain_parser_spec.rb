require_relative '../domain_parser'
  		  
describe DomainParser do
  let(:ordered_domains) { DomainParser.parse_domains('data/domain_order.csv') }

  describe '#parse_domains' do
  	it 'returns an array of all possible domains' do
    	expect(ordered_domains).to be_an Array
  	end

  	it 'has a first element that is a string equal to K.RF' do 
  		expect(ordered_domains[0]).to eq "K.RF" 
  	end
  end
end		  