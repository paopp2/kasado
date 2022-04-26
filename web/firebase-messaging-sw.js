importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyDN3zQFHS9fHxVZEEO_uDoc-xjw_WuDPXU",
  authDomain: "kasado-2022.firebaseapp.com",
  projectId: "kasado-2022",
  storageBucket: "kasado-2022.appspot.com",
  messagingSenderId: "1004868845018",
  appId: "1:1004868845018:web:a8df7bb2a10b011d4b94e3",
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});