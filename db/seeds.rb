# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create(email: "test@email.com", password: "password")
@sapps = Farm.create(name: "Sapps Farm", user_id: @user.id)
@goat_pen = Area.create(name: "Goat Pen", farm_id: @sapps.id, area_type: "Pen", capacity: 20, quantity: 16)
@pig_pen = Area.create(name: "Pig Pen", farm_id: @sapps.id, area_type: "Pen", capacity: 6, quantity: 4)
@cocoa = Animal.create(
	name: "Cocoa", 
	age: "1 year", 
	sex: "female", 
	color: "white and tan", 
	weight: 120, 
	pregnant: true, 
	date_bred: 20170407, 
	estimated_due_date: 20171010, 
	area_id: @goat_pen.id,
	animal_type: "goat" 
	)

@cocoa2 = Animal.create(
	name: "Cocoa2", 
	age: "1 year", 
	sex: "female", 
	color: "white and tan", 
	weight: 120, 
	pregnant: true, 
	date_bred: 20170407, 
	estimated_due_date: 20171010, 
	area_id: @goat_pen.id,
	animal_type: "goat" 
	)