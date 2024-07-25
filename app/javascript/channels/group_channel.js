import consumer from "channels/consumer"
// Subscription for first group chat
consumer.subscriptions.create({channel: "GroupChannel", group_name: "First chat group" }, {
  connected() {
    console.log("Successfully subscribed to first group chat")
  },

  disconnected() {
    console.log(" Successfully unsubscribed from first group chat")
  },

  received(data) {
    const messagesContainer = document.getElementById("chat-interface");
    const messageElement = document.createElement("p");
    messageElement.textContent = data.message;
    messagesContainer.appendChild(messageElement);
  }
});

// Subscription for second group chat
consumer.subscriptions.create({channel: "GroupChannel", group_name: "second chat group" }, {
  connected() {
    console.log("Successfully subscribed to second group chat")
  },

  disconnected() {
    console.log(" Successfully unsubscribed from second group chat")
  },

  received(data) {
    const messagesContainer = document.getElementById("chat-interface");
    const messageElement = document.createElement("p");
    messageElement.textContent = data.message;
    messagesContainer.appendChild(messageElement);
  }
});
