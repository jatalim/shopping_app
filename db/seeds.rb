# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	@admin = Admin.create({ email: 'admin@email.com',
               password: 'password', password_confirmation: 'password'})
    
OrderStatus.delete_all
OrderStatus.create! id: 1, status_name: "In Shopping Cart"
OrderStatus.create! id: 2, status_name: "Order Placed/Pending Delivery"
OrderStatus.create! id: 3, status_name: "Order Being Delivered"
OrderStatus.create! id: 4, status_name: "Order Completed"