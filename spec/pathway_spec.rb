require_relative '../pathway'

describe 'Pathway' do

	data = { student_name: "Jayde Beahan",
     			 goal_domains: ["K.RI", "1.RI", "2.RF", "2.RI", "3.RF"]
   }
 
  let (:pathway) {Pathway.new(data)}

  it 'has a student name' do
  	expect(pathway.student_name).to eq "Jayde Beahan"
  end

  it 'has an array of goal domains' do 
  	expect(pathway.goal_domains).to eq ["K.RI", "1.RI", "2.RF", "2.RI", "3.RF"]
  end

  it 'will not add another unit if there are already 5 units in the goal domains array' do
    pathway.add_unit("3.RL")
  	expect(pathway.goal_domains.length).to eq 5
  end

end