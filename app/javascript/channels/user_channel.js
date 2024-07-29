import consumer from "channels/consumer"
consumer.subscriptions.create({ channel: "UserChannel", user_id: recipientId }, {
  connected() {
    console.log("Connected to UserChannel");
  },

  disconnected() {
    console.log("Disconnected from UserChannel");
  },

  received(data) {
    const messagesContainer = document.getElementById("chat-interface");
    const messageElement = document.createElement("p");
    messageElement.textContent = data.message
      messagesContainer.appendChild(messageElement);
  }
})

document.getElementById('messages').insertAdjacentHTML('beforeend', data.message)