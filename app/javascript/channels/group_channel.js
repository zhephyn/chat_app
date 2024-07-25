import consumer from "channels/consumer"

consumer.subscriptions.create("GroupChannel", {
  connected() {
    console.log("Successfully connected to Web Sockets Channel")
  },

  disconnected() {
    console.log(" Successfully disconnected from Web Sockets Channel")
  },

  received(data) {
  }
});
