import consumer from "channels/consumer"
const addedUsers = new Set();
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
      if(!addedUsers.has(userId)) {
        const userDetails = document.createElement("div");
        userDetails.id = userId;
        userDetails.textContent = userEmail;
        onlineList.appendChild(userDetails);
        addedUsers.add(userId);
      }
    }
    else if (eventType === "appear") {
      //check if the email is already in list to prevent duplicates
      //const userElement = document.getElementById("user_" + userId);
      if(!addedUsers.has(userId)) {
        const userDetails = document.createElement("div");
        userDetails.textContent = userEmail;
        userDetails.id = "user_" + userId;
        onlineList.appendChild(userDetails);
        addedUsers.add(userId);
      }
    } 
    else if (eventType === "disappear") {
      var userElement = document.getElementById("user_" + userId);
      if (userElement) {
        onlineList.removeChild(userElement);
        addedUsers.delete(userId);
      }
    }
  }
})
