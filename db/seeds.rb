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

50.times do
  Book.create(
    name: Faker::Book.title,
    author: Faker::Book.author,
    edition: rand(1..5),
    price: Faker::Commerce.price(range: 10.0..50.0)
  )
end
