# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

puts "Creating restaurants..."
puts "Creating reviews..."

5.times do
  restaurant_name = Faker::Restaurant.name.to_s
  restaurant_address = Faker::Address.street_address.to_s
  restaurant_category = ["chinese", "italian", "japanese", "french", "belgian"].sample

  fake_restaurant = Restaurant.create(name: restaurant_name, address: restaurant_address, category: restaurant_category)
  20.times do
    Review.create(content: Faker::Emotion.adjective, rating: rand(0..5), restaurant: fake_restaurant)
  end
end

puts "Restaurants and reviews created :D"
