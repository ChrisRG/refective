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
User.create!(email: "boris@gmail.com", password: "password", full_name: "Boris")
owner = User.create!(email: "amara@gmail.com", password: "password", full_name: "Amara")
User.create!(email: "chris@gmail.com", password: "password", full_name: "Chris")
puts "** Users created. **"

# Item Types
puts "** Seeding item types... **"
ItemType.create(name: "Appliances", description: "Small home appliances")
ItemType.create(name: "Computers", description: "Desktop and laptop computers")
ItemType.create(name: "Bikes", description: "Road bikes, mountain bikes, city bikes")
ItemType.create(name: "Furniture", description: "Small home furniture")
ItemType.create(name: "Clothing", description: "Clothing, bags, textiles")
ItemType.create(name: "Shoes", description: "Sneakers, boots, sandals")
puts "** Item types created. **"

# Spaces
puts "** Seeding spaces... **"
GEN_AVAIL_MSG = "Mon - Fri: 5PM - 10PM, Sat: 10AM - 8PM"
user_list = User.all.to_a
space1 = Space.new(
  name: "Reparatur-Café Mohr-Villa", 
  address: "Situlistraße 73, 80939 München",
  description: Faker::Company.catch_phrase, 
  availability: GEN_AVAIL_MSG, 
  phone_number: "089 324 32 64",
)
space1.user = owner
space1.save!


space2 = Space.new(
  name: "Repair Café Ottobrunn", 
  address: "Haidgraben 1a, 85521 Ottobrunn", 
  description: Faker::Company.catch_phrase, 
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space2.user = owner
space2.save

space3 = Space.new(
  name: "Reparaturcafé am Westpark", 
  address: "Ehrwalder Str. 87, 81377 München",
  description: Faker::Company.catch_phrase, 
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space3.user = owner
space3.save
space4 = Space.new(
  name: "WerkBox³ e.V.", 
  address: "Dachauer Str. 110c, 80636 München",
  description: Faker::Company.catch_phrase, 
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space4.user = owner
space4.save
space5 = Space.new(
  name: "Nachbarschaftstreff am Walchenseeplatz", 
  address: "Bayrischzeller Str. 5, 81539 München",
  description: Faker::Company.catch_phrase, 
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space5.user = owner
space5.save
space6 = Space.new(
  name: "Haus der Eigenarbeit – HEi", 
  address: "Wörthstraße 42, 81667 München",
  description: Faker::Company.catch_phrase, 
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space6.user = owner
space6.save
space7 = Space.new(
  name: "Nachbarschaftstreff Karlingerstraße", 
  address: "Karlingerstraße 30 A, 80992 München",
  description: Faker::Company.catch_phrase, 
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space7.user = owner
space7.save
puts "** Spaces created. **"


puts "** Attaching images... **"
file = URI.open("https://res.cloudinary.com/chrisrg/image/upload/v1614943858/refective/space1_zuksfp.jpg")
space1.photo.attach(io: file, filename: "#{space1.name}.jpg", content_type: "image/jpg")
space1.save!


file = URI.open("https://res.cloudinary.com/chrisrg/image/upload/v1614943854/refective/space2_byeljp.jpg")
space2.photo.attach(io: file, filename: "#{space2.name}.jpg", content_type: "image/jpg")
space2.save!

file = URI.open("https://res.cloudinary.com/chrisrg/image/upload/v1614943852/refective/space3_k8xkfk.jpg")
space3.photo.attach(io: file, filename: "#{space3.name}.jpg", content_type: "image/jpg")
space3.save!

file = URI.open("https://res.cloudinary.com/chrisrg/image/upload/v1614943856/refective/space4_tr7fqh.jpg")
space4.photo.attach(io: file, filename: "#{space4.name}.jpg", content_type: "image/jpg")
space4.save!

file = URI.open("https://res.cloudinary.com/chrisrg/image/upload/v1614943842/refective/space5_rqkvog.jpg")
space5.photo.attach(io: file, filename: "#{space5.name}.jpg", content_type: "image/jpg")
space5.save!

file = URI.open("https://res.cloudinary.com/chrisrg/image/upload/v1614943846/refective/space6_mvh7oo.jpg")
space6.photo.attach(io: file, filename: "#{space6.name}.jpg", content_type: "image/jpg")
space6.save!

file = URI.open("https://res.cloudinary.com/chrisrg/image/upload/v1614943857/refective/space7_obhfea.jpg")
space7.photo.attach(io: file, filename: "#{space7.name}.jpg", content_type: "image/jpg")
space7.save!
puts "** Images attached. **"

# Space Item Types
puts "** Seeding space item types... **"
spaces_list = Space.all.to_a
7.times do 
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
    item_description: "#{i_type.name}",
    comment: "Need help!",
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
