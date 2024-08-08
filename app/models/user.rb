class User < ApplicationRecord
  scope :online, -> {where(online_status: true)} 
  def appear
    self.update(online_status: true)
    broadcast_online_users
  end
  def disappear
    self.update(online_status: false)
    broadcast_online_users
  end
  
  has_many :user_groups
  has_many :groups, through: :user_groups 
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  private
  def broadcast_online_users
    ActionCable.server.broadcast("appearence_channel", { event: "update_online_users", online_users: User.online.pluck(:email) })
  end

end
