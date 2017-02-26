require_relative '../domain_parser'
  		  
describe DomainParser do

  let(:domain_data) { DomainParser.parse('domain_order.csv') }

  it 'should return a hash of domains' do
    expect(domain_data).to be_a Hash
  end
end		  