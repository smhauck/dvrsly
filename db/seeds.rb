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


BanReason.create(name: "Abusive Conduct")

puts "Starting Users Seeding"
User.create(email_address: "deleted@dvrsly.com", username: "deleted", password: "deleted")
User.create(email_address: "admin@dvrsly.com", username: "admin", password: "admin")
User.create(email_address: "shannonmariehauck@gmail.com", username: "smh", password: "smh")
(1..1000).each do |i|
  User.create!(email_address: "user.#{i}@dvrsly.com", username: "user#{i}", password: "asd#{i}flkjsadfljjw23434sdja")
end
puts "Users Seeding Complete"

puts "Starting Diversions Seeding"
Diversion.create(title: "dvrsly", user_id:"3")
Diversion.create(title: "fountainpens", user_id:"3")
Diversion.create(title: "rubyonrails", user_id:"3")
Diversion.create(title: "wheelchairs", user_id:"3")
Diversion.create(title: "notebooks", user_id:"3")
Diversion.create(title: "journaling", user_id:"3")
Diversion.create(title: "writing", user_id:"3")
puts "Diversions Seeding Complete"

# puts "Starting Posts Seeding"
# rounds = 50
# (1..rounds).each do |x|
#   (1..9).each do |i|
#     Post.create!(title: "Post Title #{x}.#{i}", body: "this is the post body here #{i}", user_id: "#{i}", diversion_id: "#{i}")
#   end
#   puts "Posts Seeding: Round #{x} of #{rounds} Complete"
# end
# puts "Posts Seeding Complete"
# 
# puts "Starting Comments Seeding"
# rounds = 50
# (1..rounds).each do |x|
#   (1..5).each do |i|
#     Comment.create!(body: "this is the comment body here #{x} - #{i}", user_id: "#{i}", post_id: "#{x}")
#   end
#   puts "Comments Seeding: Round #{x} of #{rounds} Complete"
# end
# puts "Comments Seeding Complete"
# 
# puts "Starting Blogs Seeding"
# rounds = 50
# (1..rounds).each do |x|
#   (1..5).each do |i|
#     Blog.create!(title: "Blog Title #{x} - #{i}", description: "this is the blog description here #{x} - #{i}", user_id: "#{i}")
#   end
#   puts "Blogs Seeding: Round #{x} of #{rounds} Complete"
# end
# puts "Blogs Seeding Complete"

puts "All Seeding Complete"
