# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.destroy_all
User.destroy_all

user1 = User.create!(name: "testUser1", email: "test1@mail.com", password: "passtest1")
user2 = User.create!(name: "testUser2", email: "test2@mail.com", password: "passtest2")

20.times do |index|
  Post.create!(title: Faker::Book.title, body: "lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  user: [user1,user2].sample)
end

puts "Create User #{user1.name}"
puts "Create User #{user2.name}"
puts "Created #{Post.count} Post item"