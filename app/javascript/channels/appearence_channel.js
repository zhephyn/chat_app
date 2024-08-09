import consumer from "channels/consumer"
consumer.subscriptions.create("AppearenceChannel", {
  connected() {
    this.perform("appear")
  },

  disconnected() {
    this.perform("disappear")
  },

  received(data) {
    var eventType = data.event;
    var userId = data.user_id
    var userEmail = data.user_email
    const onlineUsersList = document.getElementById('online-users');
    if (eventType === 'update') {
      var userElement = document.createElement("div");
      userElement.id = 'user_' + userId;
      userElement.textContent = userEmail;
      onlineUsersList.appendChild(userElement);
    }
    else if (eventType === "disappear") {
      var userElement = document.getElementById("user" + userId)
      if (userElement)
        onlineUsersList.removeChild(userElement)
    }
  }
});
