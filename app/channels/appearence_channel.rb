class AppearenceChannel < ApplicationCable::Channel
  def subscribed
    current_user.appear
    broadcast_online_users
  end

  def unsubscribed
    current_user.disappear
    broadcast_online_users
  end

  private
  def broadcast_online_users
    ActionCable.server.broadcast("appearence_channel", {users: User.online})
  end
end
