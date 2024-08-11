import consumer from "channels/consumer"

consumer.subscriptions.create("AppearenceChannel", {
  connected() {
    this.perform("appear")
  },

  disconnected() {
    this.perform("disappear")
  },

  received(data) {
    console.log("Received data: ", data)
    var eventType = data.event;
    var userId = data.user_id;
    var userEmail = data.user_email;
    const onlineList = document.getElementById("online-users");

    if (eventType === "initial_state"){
      const userDetails = document.createElement("div");
      userDetails.textContent = userEmail;
      onlineList.appendChild(userDetails);
    }
    else if (eventType === "appear") {
      const userDetails = document.createElement("div");
      userDetails.textContent = userEmail;
      userDetails.id = "user_" + userId;
      onlineList.appendChild(userDetails);
    } 
    else if (eventType === "disappear") {
      var userElement = document.getElementById("user_" + userId);
      if (userElement) {
        onlineList.removeChild(userElement);
      }
    }
  }
})
