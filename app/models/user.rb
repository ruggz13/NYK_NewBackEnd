class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :restaurants, through: :plans
    has_many :restaurants, through: :reviews
    has_many :plans
    has_many :reviews 

end
