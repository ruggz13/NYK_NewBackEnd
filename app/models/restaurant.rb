class Restaurant < ApplicationRecord
    has_many :users, through: :plans
    has_many :users, through: :reviews
    has_many :reviews
    has_many :plans
end
