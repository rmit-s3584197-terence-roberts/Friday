# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create( :username => 'terry', :first_name => 'terry', :last_name => 'roberts', 
	:email => 's3584197@student.rmit.edu.au', :city => 'Melbourne' , :country => 'Australia', :address => '125 Test St', 
	:phone => '234567890' , :points => '600' , :rating => '0' , :password => 'password' )
User.create( :username => 'test', :first_name => 'test', :last_name => 'test', 
	:email => 's3584197@student.rmit.edu.au', :city => 'Melbourne' , :country => 'Australia', :address => '124 Test St', 
	:phone => '123456789' , :points => '600' , :rating => '0' , :password => 'password' )
