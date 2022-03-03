# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
for i in 1..24 do
  first_name = "Yash#{i}"
  last_name = "Kumar#{i}"
  email = "#{first_name}-#{last_name}@example.com"

  user = User.find_or_create_by(first_name: first_name, last_name: last_name, email: email)
  user.street_address = Faker::Address.street_address
  user.city = Faker::Address.city
  user.province = "Ontario"
  user.postal_code = Faker::Address.postcode

  if user.save
    p "User has been saved: #{email}"
 
    for _ii in 1..24 do

      message = Faker::Quote.matz
      post = Micropost.new
      post.message = message
      post.user = user
      if post.save
        p "Micropost has been saved: #{message}"
      end
    end
  end
end