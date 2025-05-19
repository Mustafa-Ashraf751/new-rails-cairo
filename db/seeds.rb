# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
# Create Users
puts "Creating Users..."
10.times do |i|
  User.create!(
    name: "User #{i+1}",
    dob: Date.today - rand(18..70).years,
    email: "user#{i+1}@example.com",
    phone_number: "123-456-#{1000+i}",
    address: "Address #{i+1}"
  )
end

# Create Editors
puts "Creating Editors..."
5.times do |i|
  Editor.create!(
    name: "Editor #{i+1}",
    email: "editor#{i+1}@example.com"
  )
end

# Create Posts with random users and editors
puts "Creating Posts and assigning editors..."
users = User.all
editors = Editor.all

20.times do |i|
  post = Post.create!(
    title: "Post #{i+1}",
    content: "Content for post #{i+1}. Lorem ipsum dolor sit amet.",
    user: users.sample
  )
  
  # Assign random editors (1-3) to each post
  editors.sample(rand(1..3)).each do |editor|
    PostEditor.create!(post: post, editor: editor)
  end
end

puts "Seeding completed!"
