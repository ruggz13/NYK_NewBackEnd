class User < ApplicationRecord
    has_many: :sessions
    has_many: :restaurants, through: :reviews
    has_many: :plans
end
