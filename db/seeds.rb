require 'faker'
require "open-uri"

puts "=====[ Seeding database ]====="
puts "** Deleting previous records... **"

Message.delete_all
Review.delete_all
Booking.delete_all
SpaceItemType.delete_all
Space.delete_all
ItemType.delete_all
User.delete_all

puts "** Records deleted. **"

# Users
puts "** Seeding users... **"
user_boris = User.create!(email: "boris@gmail.com", password: "password", full_name: "Boris")
user_amara = User.create!(email: "amara@gmail.com", password: "password", full_name: "Amara")
user_chris = User.create!(email: "chris@gmail.com", password: "password", full_name: "Chris")
user_greta = User.create!(email: "greta@gmail.com", password: "password", full_name: "Greta")
owners = [user_boris, user_amara]
puts "** Users created. **"

# Item Types
puts "** Seeding item types... **"
ItemType.create(name: "Appliances", description: "Small home appliances")
ItemType.create(name: "Electronics", description: "Electronic gear")
ItemType.create(name: "Computers", description: "Desktop and laptop computers")
ItemType.create(name: "Bikes", description: "Road bikes, mountain bikes, city bikes")
ItemType.create(name: "Furniture", description: "Small home furniture")
ItemType.create(name: "Clothing", description: "Clothing, bags, textiles")
ItemType.create(name: "Shoes", description: "Sneakers, boots, sandals")
puts "** Item types created. **"

# Spaces
puts "** Seeding spaces... **"
GEN_AVAIL_MSG = "Mon - Fri: 5PM - 10PM, Sat: 10AM - 8PM"
space1 = Space.new(
  name: "Reparatur-Café Mohr-Villa", 
  address: "Situlistraße 73, 80939 München",
  description: "We're a woodworking shop next the Mohr-Villa community center with a wide selection of hand and power tools. We can also help fix up a lot of other stuff too. Stop on by!",
  availability: GEN_AVAIL_MSG, 
  phone_number: "089 324 32 64",
)
space1.user = owners.sample
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Furniture").first
space_item.space = space1
space_item.save
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Clothing").first
space_item.space = space1
space_item.save
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Shoes").first
space_item.space = space1
space_item.save
space1.save!

space2 = Space.new(
  name: "Repair Café Ottobrunn", 
  address: "Haidgraben 1a, 85521 Ottobrunn", 
  description: "Hello! We're your one stop repair shop for electronics, gadgets, and more! We've got a ton of knowledgeable people to show you around and help you fix your things!",
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space2.user = owners.sample
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Electronics").first
space_item.space = space2
space_item.save
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Appliances").first
space_item.space = space2
space_item.save
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Computers").first
space_item.space = space2
space_item.save
space2.save

space3 = Space.new(
  name: "Reparaturcafé am Westpark", 
  address: "Ehrwalder Str. 87, 81377 München",
  description: "Don't throw away your stuff, come visit us at the Repair Cafe by Westpark! We'e got tools for fixing a wide variety of things, mainly electronics, appliances, and more! If you're looking to get something fixed or you want to learn how to do it yourself, stop on by.", 
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space3.user = user_boris
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Electronics").first
space_item.space = space3
space_item.save
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Appliances").first
space_item.space = space3
space_item.save
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Computers").first
space_item.space = space3
space_item.save
space3.save

space4 = Space.new(
  name: "WerkBox³ e.V.", 
  address: "Dachauer Str. 110c, 80636 München",
  description: "We're all about bikes here, from mountain to road. We've got all kinds of tools to help you fix whatever problems you might have. There are also people who brings their own tools to fix other things too.",
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space4.user = owners.sample
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Bikes").first
space_item.space = space4
space_item.save
space4.save

space5 = Space.new(
  name: "Nachbarschaftstreff am Walchenseeplatz", 
  address: "Bayrischzeller Str. 5, 81539 München",
  description: "We run a space out of the Walchenseeplatz community center. We work mainly with clothing, but feel free to bring anything you want to fix and we'll try to help out.",
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space5.user = owners.sample
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Clothing").first
space_item.space = space5
space_item.save
space5.save

space6 = Space.new(
  name: "Haus der Eigenarbeit – HEi", 
  address: "Wörthstraße 42, 81667 München",
  description: "Is it broke? Don't toss it! Come here and fix it! We've got tons of tools!", 
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space6.user = owners.sample
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Electronics").first
space_item.space = space6
space_item.save
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Appliances").first
space_item.space = space6
space_item.save
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Computers").first
space_item.space = space6
space_item.save
space6.save

space7 = Space.new(
  name: "Nachbarschaftstreff Karlingerstraße", 
  address: "Karlingerstraße 30 A, 80992 München",
  description: "Neighborhood community space set up to help local residents fix their personal belongings", 
  availability: GEN_AVAIL_MSG, 
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
)
space7.user = owners.sample
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Electronics").first
space_item.space = space7
space_item.save
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Appliances").first
space_item.space = space7
space_item.save
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Computers").first
space_item.space = space7
space_item.save
space_item = SpaceItemType.new
space_item.item_type = ItemType.where(name: "Clothing").first
space_item = SpaceItemType.new
space_item.space = space7
space_item.save
space_item.item_type = ItemType.where(name: "Shoes").first
space_item.space = space7
space_item.save
space7.save
puts "** Spaces created. **"

# Space Item Types
# puts "** Seeding space item types... **"
# spaces_list = Space.all.to_a
# Space.all.each do |space|
#   rand_num = rand(1..3)
#   item_types = ItemType.all
#     .reject { |itemtype| itemtype.name == "Electronics" }
#     .shuffle
#   rand_num.times do 
#     space_item = SpaceItemType.new
#     space_item.item_type = item_types.pop
#     space_item.space = space
#     space_item.save
#   end
# end
# puts "** Space item types created. **"

# Bookings
puts "** Seeding bookings... **"
user_list = owners
6.times do
  i_type = ItemType.all.sample
  booking = Booking.new(
    date: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    item_description: "#{i_type.name}",
    comment: "Need help!",
    status: "confirmed",
  )
  booking.user = owners.sample
  booking.space = Space.all.reject { |space| space == space3 }.sample
  booking.item_type = i_type
  booking.save
end
puts "** Bookings created. **"
# Reviews
puts "** Seeding random reviews... **"
Booking.all.each do |booking|
  review = Review.new(
    rating: rand(2..5),
    content: Faker::Restaurant.review
  )
  review.booking = booking
  review.user = booking.user
  review.save
end
puts "** Random reviews created. **"

puts "** Seeding fixed reviews..."
# First fixed booking and review
i_type = ItemType.all.sample
booking = Booking.new( 
  date: Faker::Date.between(from: Date.today, to: 1.month.from_now),
  item_description: "#{i_type.name}",
  comment: "Need help!",
  status: "confirmed",
)
booking.user = user_amara
booking.space = space3
booking.item_type = i_type
booking.save
review = Review.new(
  rating: 4,
  content: "The people were super friendly and I learned a lot! Boris runs a great space! "
)
review.booking = booking
review.user = booking.user
review.save

# Second fixed booking and review
i_type = ItemType.all.sample
booking = Booking.new( date: Faker::Date.between(from: Date.today, to: 1.month.from_now),
  item_description: "#{i_type.name}",
  comment: "Need help!",
  status: "confirmed",
)
booking.user = user_boris
booking.space = space3
booking.item_type = i_type
booking.save
review = Review.new(
  rating: 5,
  content: "Absolutely fantastic, Amara helped me fix an old lamp in like 10 minutes"
)
review.booking = booking
review.user = booking.user
review.save

# Third fixed booking and review
i_type = ItemType.all.sample
booking = Booking.new( date: Faker::Date.between(from: Date.today, to: 1.month.from_now),
  item_description: "#{i_type.name}",
  comment: "Need help!",
  status: "confirmed",
)
booking.user = user_greta
booking.space = space3
booking.item_type = i_type
booking.save
review = Review.new(
  rating: 4,
  content: "love coming here to fix small items from around the house. they have a ton of tools to use too"
)
review.booking = booking
review.user = booking.user
review.save
puts "** Fixed reviews created. **"

# # Messages
# puts "** Seeding messages... **"
# Booking.all.each do |booking|
#   msg = Message.new(
#     content: "Thanks for making an appointment at #{booking.space.name}! We're looking forward to your visit!"
#   )
#   msg.booking = booking
#   msg.user = booking.space.user
#   msg.save
# end
# puts "** Messages created. **"

puts "** Attaching space images... **"
file = URI.open("https://res.cloudinary.com/chrisrg/image/upload/v1614943858/refective/space1_zuksfp.jpg")
space1.photo.attach(io: file, filename: "#{space1.name}.jpg", content_type: "image/jpg")
space1.save!


file = URI.open("https://res.cloudinary.com/chrisrg/image/upload/v1615469008/refective/space9_suwvgd.jpg")
space2.photo.attach(io: file, filename: "#{space2.name}.jpg", content_type: "image/jpg")
space2.save!

file = URI.open("https://res.cloudinary.com/chrisrg/image/upload/v1615469008/refective/space8_ltbf7r.jpg")
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
puts "** Space images attached. **"

puts "** Attaching user images..."
file = URI.open("https://kitt.lewagon.com/placeholder/users/kibex92")
user_boris.photo.attach(io: file, filename: "#{space6.name}.jpg", content_type: "image/jpg")
user_boris.save!

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1609758298/wmda5l7ouqbaektxtukj.jpg")
user_amara.photo.attach(io: file, filename: "#{space7.name}.jpg", content_type: "image/jpg")
user_amara.save!

file = URI.open("https://kitt.lewagon.com/placeholder/users/chrisrg")
user_chris.photo.attach(io: file, filename: "#{space7.name}.jpg", content_type: "image/jpg")
user_chris.save!
puts "** User images attached."
puts "=====[ Finished seeding database ]====="
