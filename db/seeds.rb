# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.create(email: "test@email.com", password: "password")
@user2 = User.create(email: "test2@email.com", password: "password")
@sapps = Farm.create(name: "Sapps Farm", user_id: @user.id)
@sipsee = Farm.create(name: "Sipsee Farm", user_id: @user2.id)
@goat_pen = Area.create(name: "Goat Pen", farm_id: @sapps.id, area_type: "Pen", capacity: 20, quantity: 16)
@pig_pen = Area.create(name: "Pig Pen", farm_id: @sapps.id, area_type: "Pen", capacity: 6, quantity: 4)
@goat_pen2 = Area.create(name: "Goat Pen", farm_id: @sipsee.id, area_type: "Pen", capacity: 10, quantity: 8)
@pig_pen2 = Area.create(name: "Pig Pen", farm_id: @sipsee.id, area_type: "Pen", capacity: 7, quantity: 4)
@cocoa = Animal.create(
	name: "Cocoa", 
	age: "1 year", 
	sex: "female", 
	color: "white and tan", 
	weight: 120, 
	pregnant: true, 
	date_bred: "2017-04-07", 
	estimated_due_date: "2017-04-07", 
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
	date_bred: "2017-04-07", 
	estimated_due_date: "2017-10-10", 
	area_id: @goat_pen.id,
	animal_type: "goat" 
	)

@bob = Animal.create(
	name: "Bob", 
	age: "4 years", 
	sex: "Male", 
	color: "white", 
	weight: 150, 
	pregnant: false, 
	date_bred: "2017-04-07", 
	estimated_due_date: "2017-04-07", 
	area_id: @goat_pen2.id,
	animal_type: "goat" 
	)

@jake = Animal.create(
	name: "Jake", 
	age: "1 year", 
	sex: "male", 
	color: "white and tan", 
	weight: 100, 
	pregnant: false, 
	date_bred: "2017-04-07", 
	estimated_due_date: "2017-04-07", 
	area_id: @goat_pen2.id,
	animal_type: "goat" 
	)