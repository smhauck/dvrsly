# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end







User.create(email_address: "admin@dvrsly.com", username: "admin", password: "admin")
User.create(email_address: "deleted@dvrsly.com", username: "deleted", password: "deleted")
User.create(email_address: "smh@smh.com", username: "smh", password: "smh")
User.create(email_address: "one@one.com", username: "one", password: "one")
User.create(email_address: "two@two.com", username: "two", password: "two")
User.create(email_address: "three@three.com", username: "three", password: "three")
