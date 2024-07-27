class Message < ApplicationRecord
    belongs_to :sender, class_name: "User", foreign_key: "sender_id"
    belongs_to :reciever, class_name: "User", foreign_key: "recipient_id", optional: true
    belongs_to :group, optional: true
end
