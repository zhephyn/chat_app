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
    //var userId = data.user_id;
    //var userEmail = data.user_email;
    //var eventType = data.event;
  
    //const onlineUsersList = document.getElementById('online-users');
    
    //if (eventType === 'appear') {
      // Check if the email is already in the list
      //if (!document.getElementById('user_' + userId)) {
        //var userElement = document.createElement('div');
        //userElement.id = 'user_' + userId;
        //userElement.textContent = userEmail;
        //onlineUsersList.appendChild(userElement);
      //}
    //} else if (eventType === 'disappear') {
      //var userElement = document.getElementById('user_' + userId);
      //if (userElement) {
        //onlineUsersList.removeChild(userElement);
      //}
    //},
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
