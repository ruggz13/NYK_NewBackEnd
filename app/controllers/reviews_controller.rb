class ReviewsController < ApplicationController
    def index
        reviews = Review.all
        render json: reviews
    end
    def new
        @review = Review.new()
    end
    
    def create
        review = Review.create(review_params)
        render json: review
    
    end
    
    def update
        @review = Review.find_by(params[:id])
        @review.update(review_params)
    end
    
    def delete
        Review.find_by(params[:id]).delete()
    end 

    private 
    def review_params
        params.require(:review).permit(:user_id, :restaurant_id, :rating )

    end
    # params.require(:review).permit(:rating, user_id: [:first_name, :last_name, :email, :password, :username], restaurant_id: [:name
    #     :location
    #     :categories 
    #     :price:  
    #     :avg_review: ] )
    

end
