# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:email => 'jamiespence2@gmail.com', :password => 'test', :password_confirmation => 'test', :first_name => 'Jamie', :last_name => 'Spence', :admin => true)
User.create(:email => 'michaelrshannon@gmail.com', :password => 'test', :password_confirmation => 'test', :first_name => 'Jamie', :last_name => 'Spence', :admin => true)

Subject.create(:name => 'Distributed and Parallel Technologies', :description => 'Includes tutorials on C+MPI and Glasgow Parallel Haskell')

Tutorial.create(:name => 'C Revision', :description => 'Revision of the C programming language')
Tutorial.create(:name => 'GpH Introduction', :description => 'Introduction to Glasgow Parallel Haskell')

