# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer_1 = Customer.create!(first_name: "Ben", last_name: "S", email: "BenS@email.email", address: "123 Sesame St")
customer_2 = Customer.create!(first_name: "Greg", last_name: "P", email: "GP@email.email", address: "234 Sesame St")
tea_1 = Tea.create!(title: "Green", description: "It's green.", temperature: 111, brew_time: "1 minute")
tea_2 = Tea.create!(title: "Black", description: "It's black.", temperature: 112, brew_time: "2 minutes")
tea_3 = Tea.create!(title: "Orange Blossom", description: "It's ORANGE.", temperature: 113, brew_time: "3 minutes")
tea_4 = Tea.create!(title: "Hibiscus", description: "It's hibiscus.", temperature: 114, brew_time: "3 minutes")
subscription = Subscription.create!(title: 'Green Tea Subscription', price: 3.50, status: 0, frequency: 0, customer_id: customer_1.id, tea_id: tea_1.id)
subscription = Subscription.create!(title: 'Black Tea Subscription', price: 3.50, status: 0, frequency: 0, customer_id: customer_1.id, tea_id: tea_2.id)
subscription = Subscription.create!(title: 'Orange Blossom Tea Subscription', price: 3.50, status: 0, frequency: 0, customer_id: customer_1.id, tea_id: tea_3.id)
