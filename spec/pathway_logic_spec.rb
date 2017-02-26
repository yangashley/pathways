require_relative '../pathway_logic'
 
describe '#lowest_domain' do
  let (:test_data) { {"Student Name"=>"Albin Stanton", "RF"=>"2", "RL"=>"3", "RI"=>"K", "L"=>"3"} }
  
  it 'returns the first lowest_domain from the student test hash' do 
    expect(PathwayLogic.lowest_domain(test_data)).to eq "K.RI"
  end
end