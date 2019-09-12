class PlansController < ApplicationController
    def index
    plans = Plan.all
    render json: plans, except: [:created_at, :updated_at]
    end
    def new
        @plan = Plan.new()
    end
    
    def create
    plan = Plan.create(plans_params)
    render json: plan 
    end
    
    def update
        @plan = Plan.find_by(params[:id])
        @plan.update(plans_params)
    end
    
    def delete
        Plan.find_by(params[:id]).delete()
    end 
    private 
    def plans_params
        params.require(:plan).permit(:date, :name, user_ids: [], restaurant_ids: []  )
    end
end

