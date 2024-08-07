import consumer from "channels/consumer"

consumer.subscriptions.create("AppearenceChannel", {
  connected() {
    this.perform("appear")
  },

  disconnected() {
    this.perform("disappear")
  },

  received(data) {
    const onlineUsersList = document.getElementById('online-users');
    onlineUsersList.innerHTML = '';
    data.users.forEach(user => {
      const userElement = document.createElement('li');
      userElement.innerText = user.email;
      onlineUsersList.appendChild(userElement);
    });
  }
});
