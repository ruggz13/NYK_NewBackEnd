class User < ApplicationRecord
    has_many :restaurants, through: :reviews
    has_many :plans
end
