# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#News_Item.create( #Eurgh problem with NewsItem/News_Item Model
#  :name => 'Welcome', 
#  :content => 'Welcome to Jamie\'s tutorial website. This website is in development and this news item is generated from the initial seed data. Please view the available Subjects and associated tutorials by using the nav bar above.'
#)

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

subjects = []
subjects << Subject.create(
  :name => 'Glasgow Parallel Haskell', 
  :description => 'Tutorials GpH'
)
Tutorial.create(
  :name => 'GpH Introduction', 
  :description => 'Introduction to Glasgow Parallel Haskell',
  :subject_id => subjects.first.id
)

