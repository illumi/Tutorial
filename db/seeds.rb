# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
users << User.create(
      :email => 'jamiespence2@gmail.com', 
      :password => 'testing', 
      :first_name => 'Jamie', 
      :last_name => 'Spence', 
      :admin => true
    )
users << User.create(
      :email => 'michaelrshannon@gmail.com', 
      :password => 'tesing', 
      :first_name => 'Michael', 
      :last_name => 'Shannon', 
      :admin => true
    )
    
Newsitem.create(
  :title => 'Welcome', 
  :content => 'Welcome to Jamie\'s tutorial website. This website is in development and this news item is generated from the initial seed data. Please view the available Subjects and associated tutorials by using the nav bar above.',
  :user_id => users.first.id
)

subjects = []
subjects << Subject.create(
  :name => 'Glasgow Parallel Haskell', 
  :description => 'These tutorials assume previous knowlege of Haskell. There are already some good resources for learning Haskell online so reading some of the following might be a good idea. [Real World Haskell](http://book.realworldhaskell.org/read/) is available freely and is also available to buy as a book.'
)

Tutorial.create(
  :name => 'GpH Introduction', 
  :description => 'Introduction to Glasgow Parallel Haskell.',
  :content => '',
  :subject_id => subjects.first.id
)
Tutorial.create(
  :name => 'Normal Forms', 
  :description => 'Introduction to normal forms',
  :content => '',
  :subject_id => subjects.first.id
)
Tutorial.create(
  :name => 'Introducing parallelism', 
  :description => 'Your first GpH program!',
  :content => '',
  :subject_id => subjects.first.id
)
Tutorial.create(
  :name => 'Evaluation Strategies', 
  :description => 'Separating Computation and Coordination ',
  :content => '',
  :subject_id => subjects.first.id
)