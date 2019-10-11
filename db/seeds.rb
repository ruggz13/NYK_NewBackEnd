require 'rest-client'
require 'json'
require 'pry'
require 'faker'
require 'geocoder'
require 'byebug'
User.delete_all
Restaurant.delete_all
Plan.delete_all
Review.delete_all









STATES = ["WestVirginia", "Minnesota", "Tennessee", "Maryland", "Connecticut", "NorthDakota", "Oregon", "Oklahoma", "Montana", "Nebraska", "Missouri", "RhodeIsland", "NewYork", "Kansas", "NewJersey", "Washington", "California", "NewHampshire", "Georgia", "North Carolina", "Illinois", "Colorado", "Vermont", "Nevada", "Iowa", "Delaware", "SouthCarolina", "Mississippi", "Wyoming", "Louisiana", "Kentucky", "Alabama", "Arizona", "Texas", "Michigan", "Alaska", "Ohio", "Pennsylvania", "Hawaii", "Massachusetts", "Wisconsin", "Utah", "South Dakota", "Indiana", "New Mexico", "Virginia", "Florida", "Idaho", "Maine", "Arkansas", "Washingtondc"]
Price = ['$', '$$', '$$$', '$$$$']
50.times do 
    state = STATES.sample
    url2 = "https://api.yelp.com/v3/businesses/search?categories=Restaurants&location=Washingtondc&limit=50"
    response2 = RestClient.get(url2, headers={Authorization: "Bearer #{Rails.application.credentials[:yelp][:api_key]}"})
    # ENV["YELP_API_KEY"]
    # Rails.application.credentials[:yelp][:api_key]
    json2 = JSON.parse(response2)
    (0...json2["businesses"].length).each do |number|
    
Restaurant.create(
    name: json2["businesses"][number]["name"], 
    location: json2["businesses"][number]["location"]["display_address"], 
    categories: json2["businesses"][0]["categories"][0]["title"], 
    price: json2["businesses"][number]["price"], 
    url: json2["businesses"][number]["image_url"],
    avg_review: json2["businesses"][number]["rating"])    
end
end
   









20.times do 
name = [Faker::Name.first_name, Faker::Name.last_name]
User.create(
    first_name: "#{name[0]}", 
    last_name: "#{name[1]}", 
    email: Faker::Internet.email(name: "#{name[0]} #{name[1]}"), 
    password: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true), 
    username: Faker::Internet.username(specifier: "#{name[0]} #{name[1]}", separators: %w(. _ -))
    )
end


30.times do 
    Plan.create(
    date: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today), 
    user_id: User.all.sample.id, 
    restaurant_id: Restaurant.all.sample.id, 
    name: Faker::Lorem.word )
  end

  20.times do 
    Plan.create(
    date: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today), 
    user_id: User.all.sample.id, 
    restaurant_id: Restaurant.all.sample.id,
    name: Faker::Lorem.word )
  end

  
  40.times do 
    Review.create(
       user_id: User.all.sample.id, restaurant_id: Restaurant.all.sample.id, rating: Faker::Number.within(range: 1..5))
  end

 




#   @jesse = User.find_by(id: 101 )

#   40.times do 
  

#     Review.create(user_id: @jesse.id, restaurant_id: Restaurant.all.sample.id, rating: Faker::Number.within(range: 1..5))

#     Plan.create(
#         date: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today), 
#         user_id: @jesse.id, 
#         restaurant_id: Restaurant.all.sample.id, 
#         name: Faker::Lorem.word )
#     end


