// Get the recipient ID from the chat interface element
const chatInterface = document.getElementById("chat-interface");
const RecipientId = chatInterface.dataset.recipientId;

import consumer from "channels/consumer"

consumer.subscriptions.create({channel: "UserChannel", user_id: RecipientId}, {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    const messagesContainer = document.getElementById("chat-interface");
    const messageElement = document.createElement("p");
    messageElement.textContent = data.message
    messagesContainer.appendChild(messageElement);
  }
});
