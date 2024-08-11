class AppearenceChannel < ApplicationCable::Channel
  @@online_users = []
  def subscribed
    stream_from "appearence_channel"
    current_user.appear
    @@online_users << current_user unless @@online_users.include?(current_user)
    @@online_users.each do |user| 
      transmit({event: "initial_state", user_id: user.id, user_email: user.email})
    end 
  end

  def unsubscribed
    current_user.disappear
    @@online_users.delete(current_user)
  end
end

