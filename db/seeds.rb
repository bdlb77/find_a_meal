# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

# TODO: Write a seed to insert 100 posts in the database
100.times do
  post = Post.new(
    location: Faker::Address.community,
    date: Faker::Internet,
    time: Faker::Time.forward(23, :morning),
    min_p: Faker::Number.between(1, 3),
    max_p: Faker::Number.between(6, 14),
    description: GameOfThrones.quote,
    name: GameOfThrones.character 
  )
  post.save!
end
puts "finished!"
