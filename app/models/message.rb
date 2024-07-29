class Message < ApplicationRecord
    belongs_to :sender, class_name: "User", foreign_key: "sender_id"
    belongs_to :recipient, class_name: "User", foreign_key: "recipient_id", optional: true
    belongs_to :group, optional: true
    validates :content, presence: true
    validates :sender_id, presence: true
    validates :recipient_id, presence: true, if: -> {group_id.nil?}
    validate :sender_is_not_recipient
    
    private
    def sender_is_not_recipient
        if sender_id == recipient_id
            errors.add(:recipient_id, "User cant message themselves, sender Id is equal to recipient Id")
        end
    end
end
