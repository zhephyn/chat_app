class User < ApplicationRecord
  scope :online, -> {where(online_status: true)} 
  def appear
    self.update(online_status: true)
    ActionCable.server.broadcast("appearence_channel", { event: "appear", user_id: self.id, user_email: self.email })
  end
  def disappear
    self.update(online_status: false)
    ActionCable.server.broadcast("appearence_channel", { event: "disappear", user_id: self.id, user_email: self.email })
  end
  
  has_many :user_groups
  has_many :groups, through: :user_groups 
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "recipient_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
