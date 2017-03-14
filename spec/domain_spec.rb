require_relative '../models/domain'
require_relative '../domain_parser'

describe Domain do
  describe '#all_grades_in_domain' do
    let(:all_domains) { DomainParser.parse_domains('data/domain_order.csv') }
    let(:rf_array) { Domain.new("RF").all_grades_in_domain(all_domains) }
    
    it 'returns an array of all the possible grades for a domain' do
      expect(rf_array). to eq ["K.RF", "1.RF", "2.RF", "3.RF"]
    end  
  end
end