require_relative '../domain_parser'
  		  
describe DomainParser do

  let(:domain_data) { DomainParser.parse('data/domain_order.csv') }

  it 'should return a hash with the grade as a key and an array of domains as the value' do
    expect(domain_data).to be_a Hash
  end

  it 'should represent K for kindergarten as 0' do 
  	expect(domain_data).to include("0"=>["RF", "RL", "RI"])
  end
end		  