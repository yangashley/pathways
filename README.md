# Learning Pathways 

## Summary
This exercise uses students' standardized test scores and the Common Core State Standards to determine individualized learning pathways for each student. It uses domain information from domain_order.csv and student test data from student_tests.csv in the data directory to generate learning paths for each student.

## How
* Clone the repo
* Install gems
``` bash
$ bundle install
```
* Run the following command to generate learning paths
``` bash
$ ruby app.rb learning paths
```

## Dependencies
* Ruby 2.2.5 
* RSpec 3.5.4

## Design Decisions
* I did my best to use the single-responsibilty principle while organizing my code. 
	* I created separate modules for parsing the domain orders and the student test data.
	* I put the logic for determining goal domains in a separate module as well.
* I used hashes and arrays for keeping track of the data because they have many methods that allowed me to manipulate the structures to suit my needs

