class Plan < ApplicationRecord
    belongs_to :user
    belongs_to :restaurants
end
