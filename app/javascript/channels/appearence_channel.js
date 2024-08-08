import consumer from "channels/consumer"
document.addEventListener("turbo:load", function(){
consumer.subscriptions.create("AppearenceChannel", {
  connected() {
    this.perform("appear")
  },

  disconnected() {
    this.perform("disappear")
  },

  received(data) {
    var eventType = data.event;
  const onlineUsersList = document.getElementById('online-users');
  if (eventType === 'update_online_users') {
    // Clear the existing list
    onlineUsersList.innerHTML = '';

    // Add each online user to the list
    data.online_users.forEach(function(userEmail) {
      var userElement = document.createElement('div');
      userElement.textContent = userEmail;
      onlineUsersList.appendChild(userElement);
    });
  }
  }
});
})
