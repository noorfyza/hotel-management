require 'pry'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(0..9).each do |i|
  Customer.create(first_name: 'user', last_name: i.to_s, age: 24, sex: 'male', address: '#371, Near HSR, bengaluru', mobile: 99888777, email: "user_#{i}@gmail.com")
end

room_types = %w[Single Double Family Queen King Twin Executive\ Suite Presidential\ Suite Connecting\ rooms]
room_price = [1500, 5000, 6500, 7000, 8500, 10000, 12300, 13000, 10000]
room_types.each_with_index do |room_type, index|
  Room.create(room_no: 100 + index, name: "#{room_type} hotel stay", room_type: room_type, facilities: 'All the amenities included', price: room_price[i], availaibility: true)
end
