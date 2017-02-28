require_relative '../pathway'

describe 'Pathway' do

	let(:student_name) {"Jayde Beahan"} 
  let(:goal_domains) {["K.RI", "1.RI", "2.RF", "2.RI"]} 
 
  let (:pathway) {Pathway.new(student_name, goal_domains)}

  it 'has a student name' do
  	expect(pathway.student_name).to eq "Jayde Beahan"
  end

  it 'has an array of goal domains' do 
  	expect(pathway.goal_domains).to eq ["K.RI", "1.RI", "2.RF", "2.RI"]
  end

  describe '#add_unit_to_goal_domains' do 
    it 'will not add the first domain if it is not part of the domain order' do
      pathway.add_unit_to_goal_domains("1.L")
      expect(pathway.goal_domains.last).to eq "2.RI"
    end

    it 'adds the first domain to the goal domains array if it is part of the domain order' do
      pathway.add_unit_to_goal_domains("3.RL")
      expect(pathway.goal_domains.last).to eq "3.RL"
    end

    it 'will not add another unit if there are already 5 units in the goal domains array' do
      pathway.add_unit_to_goal_domains("3.RL")
    	expect(pathway.goal_domains.length).to eq 5
    end
  end
end