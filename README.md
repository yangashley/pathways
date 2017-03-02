# Learning Pathways 

## Summary
This exercise uses students' standardized test scores and the Common Core State Standards to determine individualized learning pathways for each student. It uses domain information from domain_order.csv and student test data from student_tests.csv in the data directory to generate learning paths for each student.

## How
* Clone the repo
* Install gems
``` 
$ bundle install
```
* Run the following command to write generated learning paths to student_pathways.csv
``` 
$ ruby app.rb 
```

## Dependencies
* Ruby 2.2.5 
* RSpec 3.5.4

## Design Decisions
* I did my best to use the single-responsibilty principle while organizing my code. 
	* I created separate modules for parsing the domain orders and the student test data.
	* I put the logic for determining goal domains in a separate module as well.
* I used hashes and arrays for keeping track of the data because they have many methods that allowed me to manipulate the structures to suit my needs
* Adding a Domain class: after getting the program to generate the correct learning paths and write the Pathway objects to a CSV file, I refactored the code by creating a Domain class. Doing this allowed me to eliminate a method in the controller.
	* Instead of splitting the domain into two parts to get abbreviated domain name in the controller, I did this step in the intialize method for Domain
``` 
$ "1.RF".split(".")[-1]
```
	* I took #all_grades_in_domain out of DomainParser and put it in Domain



## Takeaways
* While I did break the challenge into smaller pieces during my first attempt, I think that I was expecting program to behave like a human. I tried to write a program that would remember the correct domain order, what domains were already part of the pathway, and what domains were next.
	* I tried to find the lowest domain and then build the pathway by checking each grade/domain one by one.
* After rephrasing the problem, my next attempt at the exercise was very similar to how a person might sit down and create learning paths by hand. 
	* Instead of building pathways one domain at a time, I collected all possible domains for a pathway and picked the first five from a large collection.
