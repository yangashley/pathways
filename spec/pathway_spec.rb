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
end