# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# TODO: Write a seed to insert 100 posts in the database
Event.destroy_all
Booking.destroy_all
puts "events destroyed!"
puts "seeding.."
25.times do
  event = Event.new(
    address: Faker::Address.full_address,
    date: Faker::Date.forward(23),
    time: Faker::Time.forward(23, :morning),
    min_p: Faker::Number.between(2, 5),
    max_p: Faker::Number.between(6, 14),
    description: Faker::Friends.quote, 
    name: Faker::Internet.user_name,
    photo: "https://source.unsplash.com/collection/1322972/", #=> "http://placehold.it/300x300.png/000"
    price: Faker::Number.decimal(2)
  )
  event.save!
end
puts "finished!"
