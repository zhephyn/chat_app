class User < ApplicationRecord
  has_many :user_groups
  has_many :groups, through: :user_groups 
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
