# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Starting Seeding"

# rr = Rails.root.to_s + "/db/seeds/"
# puts "education_levels.rb"
# load "#{rr}education_levels.rb"
# puts "industries.rb"
# load "#{rr}industries.rb"


User.create(email_address: "admin@dvrsly.com", username: "admin", password: "admin")
User.create(email_address: "deleted@dvrsly.com", username: "deleted", password: "deleted")
User.create(email_address: "smh@smh.com", username: "smh", password: "smh")
User.create(email_address: "one@one.com", username: "one", password: "one")
User.create(email_address: "two@two.com", username: "two", password: "two")
User.create(email_address: "three@three.com", username: "three", password: "three")

Diversion.create(title: "fountainpens", user_id:"1")
Diversion.create(title: "wheelchairs", user_id:"1")
Diversion.create(title: "spyders", user_id:"3")
Diversion.create(title: "guns", user_id:"3")
Diversion.create(title: "cars", user_id:"4")
Diversion.create(title: "stoves", user_id:"5")
Diversion.create(title: "tables", user_id:"6")
Diversion.create(title: "mugs", user_id:"3")
Diversion.create(title: "phones", user_id:"6")


puts "Posts Seeding Starting"
rounds = 6
(1..rounds).each do |x|
  (1..50).each do |i|
    Post.create!(title: "Post Title #{i}", body: "this is the body here #{i}", user_id: "#{x}", diversion_id: "#{x}")
  end
  puts "Posts Seeding: Round #{x} of #{rounds} Complete"
end
puts "Posts Seeding Complete"

puts "All Seeding Complete"
