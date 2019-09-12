require 'faker'
#  

Price = ['$', '$$', '$$$', '$$$$']

# Pics = []
# 300.times do 
#     Pics << Faker::LoremPixel.image(size: "200x300", is_gray: false, category: 'food')
# end






# 100.times do 
# first_name = [Faker::Name.first_name, Faker::Name.first_name,Faker::Name.first_name, Faker::Name.first_name, Faker::Name.first_name, Faker::Name.first_name, Faker::Name.first_name, Faker::Name.first_name, Faker::Name.first_name, Faker::Name.first_name]
# last_name = [Faker::Name.last_name, Faker::Name.last_name, Faker::Name.last_name, Faker::Name.last_name, Faker::Name.last_name, Faker::Name.last_name, Faker::Name.last_name, Faker::Name.last_name, Faker::Name.last_name]
# full_name = ["#{first_name.sample} #{last_name.sample}", "#{first_name.sample} #{last_name.sample}", "#{first_name.sample} #{last_name.sample}", "#{first_name.sample} #{last_name.sample}", "#{first_name.sample} #{last_name.sample}", "#{first_name.sample} #{last_name.sample}", "#{first_name.sample} #{last_name.sample}", "#{first_name.sample} #{last_name.sample}"]
# User.create(
#     first_name: "#{first_name.sample}", 
#     last_name: "#{last_name.sample}", 
#     email: Faker::Internet.email(name: "#{full_name.sample}"), 
#     password: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true), 
#     username: Faker::Internet.username(specifier: "#{full_name.sample}", separators: %w(. _ -))
#     )
#     first_name << Faker::Name.first_name
#     last_name << Faker::Name.last_name
#     full_name << "#{Faker::Name.first_name} #{Faker::Name.last_name}"
# end

# 200.times do 
#     i = [Faker::Number.within(range: 1..10)]
#     pics = [Faker::LoremPixel.image(size: "200x300", is_gray: false, category: 'food', number: i.sample), Faker::LoremFlickr.image(size: "200x300", search_terms: ['food']) ]
# name = [Faker::Restaurant.name, Faker::Restaurant.name, Faker::Restaurant.name, Faker::Restaurant.name, Faker::Restaurant.name, Faker::Restaurant.name, Faker::Restaurant.name, Faker::Restaurant.name, Faker::Restaurant.name, Faker::Restaurant.name, Faker::Restaurant.name, Faker::Restaurant.name]

# Restaurant.create(
#     name: "#{name.sample}" , 
#     location: Faker::Address.street_address, 
#     categories: Faker::Restaurant.type, 
#     price: Price.sample, 
#     url: pics.sample,
#     avg_review: Faker::Number.within(range: 1..5))
#     name << Faker::Restaurant.name
    
# end



# 30.times do 
#     Plan.create(
#     date: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today), 
#     user_id: User.all.sample.id, 
#     restaurant_id: Restaurant.all.sample.id, 
#     name: Faker::Lorem.word )
#   end

#   5.times do 
#     Plan.create(
#     date: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today), 
#     user_id: 1, 
#     restaurant_id: Restaurant.all.sample.id, 
#     name: Faker::Lorem.word )
#   end

  
#   100.times do 
#     Review.create(user_id: User.all.sample.id, restaurant_id: Restaurant.all.sample.id, rating: Faker::Number.within(range: 1..5))
#   end

 




  @jesse = User.find_by(id: 101 )

  40.times do 
  

    Review.create(user_id: @jesse.id, restaurant_id: Restaurant.all.sample.id, rating: Faker::Number.within(range: 1..5))

    Plan.create(
        date: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today), 
        user_id: @jesse.id, 
        restaurant_id: Restaurant.all.sample.id, 
        name: Faker::Lorem.word )
    end


