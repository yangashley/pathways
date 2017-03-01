require_relative '../domain_parser'
  		  
describe DomainParser do

  let(:domain_data) { DomainParser.parse('data/domain_order.csv') }
  let(:ordered_domains) { DomainParser.parse_domains('data/domain_order.csv') }

  it 'returns a hash with the grade as a key and an array of domains as the value' do
    expect(domain_data).to be_a Hash
  end

  describe '#parse_domains' do
  	it 'returns an array of all possible domains' do
    	expect(ordered_domains).to be_an Array
  	end

  	it 'has a first element that is a string equal to K.RF' do 
  		expect(ordered_domains[0]).to eq "K.RF" 
  	end
  end

  describe '#grades_in_each_domain' do
    let(:grades_domains) { DomainParser.grades_in_each_domain('data/domain_order.csv') }
    
    it 'returns a hash with domains for keys' do
      expect(grades_domains.keys). to eq ["RF", "RL", "RI", "L"]
    end  

    it 'returns a hash with values that are arrays of all possible grades for a domain' do
      expect(grades_domains.values[0]). to eq ["K.RF", "1.RF", "2.RF", "3.RF"]
    end
  end
end		  