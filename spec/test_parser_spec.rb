require_relative '../test_parser'

describe TestParser do
  describe '#parse_tests' do 
    let(:student_data) { TestParser.parse_tests('data/student_tests.csv') }

    it 'returns a hash' do 
      expect(student_data).to be_a Hash
    end

    it 'keys of the hash are student names' do 
      expect(student_data.keys[0]).to eq "Albin Stanton"
    end 

    it 'values of the hash are arrays representing the grade level and domain students scored in' do 
      expect(student_data.values[0]).to eq ["2.RF", "3.RL", "K.RI", "3.L"]
    end

    it 'does not include headers from original CSV' do 
      expect(student_data).not_to include "Student Name"
    end 
  end
end		  

