class RestaurantsController < ApplicationController
    def index
        restaurants = Restaurant.all
        render json: RestaurantSerializer.new(restaurants)
    end
    def new
        @restaurant = Restaurant.new()
    end
    
    def create
        @restaurant = Restaurant.create(restaurant_params)
    
    end
    
    def update
        @restaurant = Restaurant.find_by(params[:id])
        @restaurant.update(restaurant_params)
    end
    
    def delete
        Restaurant.find_by(params[:id]).delete()
    end 

    private 
    def restaurant_params
        params.require(:restaurant).permit(:name, :location, :categories, :price, :avg_review)
    end
   
    
end
