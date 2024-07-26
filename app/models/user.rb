class User < ApplicationRecord
  has_many :messages 
  has_many :groups
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
