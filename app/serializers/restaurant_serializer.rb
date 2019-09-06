class RestaurantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :location, :categories, :price, :avg_review
end
