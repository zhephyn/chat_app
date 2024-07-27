import consumer from "channels/consumer"

consumer.subscriptions.create({channel: "UserChannel", user_id: userId}, {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    const messagesContainer = document.getElementById("chat-interface");
    const messageElement = document.createElement("p");
    messageElement.textContent = data.message;
    messagesContainer.appendChild(messageElement);
  }
});
