require 'faker'
require "open-uri"

puts "=====[ Seeding database ]====="
puts "** Deleting previous records... **"

Booking.delete_all
SpaceItemType.delete_all
Space.delete_all
ItemType.delete_all
User.delete_all
Message.delete_all
Review.delete_all

puts "** Records deleted. **"

# Users
puts "** Seeding users... **"
User.create(email: "boris@gmail.com", password: "password", full_name: "Boris")
User.create(email: "amara@gmail.com", password: "password", full_name: "Amara")
User.create(email: "chris@gmail.com", password: "password", full_name: "Chris")
puts "** Users created. **"

# Item Types
puts "** Seeding item types... **"
ItemType.create(name: "Appliance", description: "Small home appliances")
ItemType.create(name: "Computer", description: "Desktop and laptop computers")
ItemType.create(name: "Bicycle", description: "Road bikes, mountain bikes, city bikes")
puts "** Item types created. **"

# Spaces
puts "** Seeding spaces... **"
user_list = User.all.to_a
space1 = Space.new(
  name: "Munich Repair Cafe", 
  address: Faker::Address.street_address, 
  description: Faker::Company.catch_phrase, 
  availability: Faker::Lorem.sentence(word_count: 10), 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  latitude: rand(47.5..48.1),
  longitude: rand(11.0..11.5)
)
space1.user = user_list.pop
space1.save
space2 = Space.new(
  name: "Scotty's Garage", 
  address: Faker::Address.street_address, 
  description: Faker::Company.catch_phrase, 
  availability: Faker::Lorem.sentence(word_count: 10), 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  latitude: rand(47.5..48.1),
  longitude: rand(11.0..11.5)
)
space2.user = user_list.pop
space2.save
space3 = Space.new(
  name: "Apple (we don't) Care", 
  address: Faker::Address.street_address, 
  description: Faker::Company.catch_phrase, 
  availability: Faker::Lorem.sentence(word_count: 10), 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  latitude: rand(47.5..48.1),
  longitude: rand(11.0..11.5)
)
space3.user = user_list.pop
space3.save
puts "** Spaces created. **"

# Space Item Types
puts "** Seeding space item types... **"
spaces_list = Space.all.to_a
3.times do 
  space_item = SpaceItemType.new
  space_item.item_type = ItemType.all.to_a.sample
  space_item.space = spaces_list.pop
  space_item.save
end
puts "** Space item types created. **"

# Bookings
puts "** Seeding bookings... **"
3.times do
  i_type = ItemType.all.sample
  booking = Booking.new(
    date: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    item_description: "Fix my #{i_type.name}",
    comment: Faker::Lorem.sentence(word_count: 8),
    status: "confirmed",
  )
  booking.user = User.all.sample
  booking.space = Space.all.sample
  booking.item_type = i_type
  booking.save
end
puts "** Bookings created. **"
puts "=====[ Finished seeding database ]====="
# TODO:
# Reviews
# puts "** Seeding reviews... **"
# puts "** Reviews created. **"

# Messages
# puts "** Seeding messages... **"
# puts "** Messages created. **"
