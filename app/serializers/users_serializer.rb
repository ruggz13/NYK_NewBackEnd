class UsersSerializer < ActiveModel::Serializer
  has_many :plans
  has_many :reviews 
  has_many :restaurants, through: :plans
    has_many :restaurants, through: :reviews



  attributes :id, :first_name, :last_name, :username, :email, :restaurants, :reviews, :plans
end
