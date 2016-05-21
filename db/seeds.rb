# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Let's add some users up in here:

User.create( :username => 'terry', :first_name => 'terry', :last_name => 'roberts', 
	:email => 's3584197@student.rmit.edu.au', :city => 'Melbourne' , :country => 'Australia', :address => '125 Test St', 
	:phone => '234567890' , :points => '600' , :rating => '0' , :password => 'password' )

User.create( :username => 'micheald', :first_name => 'Michael', :last_name => 'Daniels', 
	:email => 's3584197@student.rmit.edu.au', :city => 'Melbourne' , :country => 'Australia', :address => '124 Test St', 
	:phone => '123456789' , :points => '600' , :rating => '0' , :password => 'password' )

User.create( :username => 'jeremyj', :first_name => 'Jeremy', :last_name => 'Kyle', 
	:email => 's3584197@student.rmit.edu.au', :city => 'Melbourne' , :country => 'Australia', :address => '124 Test St', 
	:phone => '123456789' , :points => '600' , :rating => '0' , :password => 'password' )

User.create( :username => 'jordans', :first_name => 'Jordan', :last_name => 'Smith', 
	:email => 's3584197@student.rmit.edu.au', :city => 'Melbourne' , :country => 'Australia', :address => '124 Test St', 
	:phone => '123456789' , :points => '600' , :rating => '0' , :password => 'password' )

User.create( :username => 'jamese', :first_name => 'James', :last_name => 'Edward', 
	:email => 's3584197@student.rmit.edu.au', :city => 'Melbourne' , :country => 'Australia', :address => '124 Test St', 
	:phone => '123456789' , :points => '600' , :rating => '0' , :password => 'password' )

User.create( :username => 'tobyt', :first_name => 'Toby', :last_name => 'Thomas', 
	:email => 's3584197@student.rmit.edu.au', :city => 'Melbourne' , :country => 'Australia', :address => '124 Test St', 
	:phone => '123456789' , :points => '600' , :rating => '0' , :password => 'password' )

User.create( :username => 'camerond', :first_name => 'Cameron', :last_name => 'Diaz', 
	:email => 's3584197@student.rmit.edu.au', :city => 'Melbourne' , :country => 'Australia', :address => '124 Test St', 
	:phone => '123456789' , :points => '600' , :rating => '0' , :password => 'password' )

User.create( :username => 'haroldk', :first_name => 'Harold', :last_name => 'Kelly', 
	:email => 's3584197@student.rmit.edu.au', :city => 'Melbourne' , :country => 'Australia', :address => '124 Test St', 
	:phone => '123456789' , :points => '600' , :rating => '0' , :password => 'password' )


# And now some properties...



