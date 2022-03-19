const functions = require("firebase-functions");
const admin = require("firebase-admin");
const user_info_data = require("./test_data/user_info.json");
const courts_data = require("./test_data/courts.json");
const test_data = Object.assign({},courts_data, user_info_data);

admin.initializeApp();
const db = admin.firestore();
const userInfoRef = db.collection('user_info');
const courtsRef = db.collection('courts');

exports.populateUserInfo = functions.https.onRequest(async (req, res) =>  {
    test_data.userInfoList.forEach(addUserInfo);
    async function addUserInfo(userInfo) {
        await userInfoRef.doc(userInfo.id).set(userInfo);
    }
    res.json({result: "Populated 'user_info'"});
});

exports.populateCourts = functions.https.onRequest(async (req, res) =>  {
    test_data.courtsList.forEach(addCourt);
    async function addCourt(court) {
        await courtsRef.doc(court.id).set(court);
    }
    res.json({result: "Populated 'courts'"});
});
