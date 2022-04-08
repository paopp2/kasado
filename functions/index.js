const functions = require("firebase-functions");
const admin = require("firebase-admin");
const user_info_data = require("./test_data/user_info.json");
const courts_data = require("./test_data/courts.json");
const teams_data = require("./test_data/teams.json");
const test_data = Object.assign({}, teams_data, courts_data, user_info_data);

admin.initializeApp();
const db = admin.firestore();
const userInfoRef = db.collection('user_info');
const courtsRef = db.collection('courts');
const teamsRef = db.collection('teams');

exports.populateAll = functions.https.onRequest(async (req, res) => {
    test_data.userInfoList.forEach(addUserInfo);
    async function addUserInfo(userInfo) {
        await userInfoRef.doc(userInfo.id).set(userInfo);
    }
    test_data.courtsList.forEach(addCourt);
    async function addCourt(court) {
        await courtsRef.doc(court.id).set(court);
    }
    test_data.teamsList.forEach(addTeam);
    async function addTeam(team) {
        await teamsRef.doc(team.id).set(team);
    }
    res.json({ result: "Populated ALL" });
});

exports.populateUserInfo = functions.https.onRequest(async (req, res) => {
    test_data.userInfoList.forEach(addUserInfo);
    async function addUserInfo(userInfo) {
        await userInfoRef.doc(userInfo.id).set(userInfo);
    }
    res.json({ result: "Populated 'user_info'" });
});

exports.populateCourts = functions.https.onRequest(async (req, res) => {
    test_data.courtsList.forEach(addCourt);
    async function addCourt(court) {
        await courtsRef.doc(court.id).set(court);
    }
    res.json({ result: "Populated 'courts'" });
});

exports.populateTeams = functions.https.onRequest(async (req, res) => {
    test_data.teamsList.forEach(addTeam);
    async function addTeam(team) {
        await teamsRef.doc(court.id).set(team);
    }
    res.json({ result: "Populated 'teams'" });
});

exports.calcDeriveableStats = functions.firestore.document('user_info/{userId}').onUpdate(async (change, context) => {
    const preUserInfo = change.before.data();
    const updatedUserInfo = change.after.data();
    if (updatedUserInfo && updatedUserInfo.overviewStats && updatedUserInfo.overviewStats.hasOwnProperty('gamesPlayed')) {
        let preGamesPlayed;
        try {
            preGamesPlayed = preUserInfo.overviewStats.gamesPlayed;
        } catch {
            preGamesPlayed = 0;
        }
        if (preGamesPlayed != updatedUserInfo.overviewStats.gamesPlayed) {

            const stats = updatedUserInfo.overviewStats;
            const totalPoints = (stats.totalThreePM * 3) + (stats.totalTwoPM * 2) + stats.totalFtm;
            const totalAttempts = stats.totalThreePA + stats.totalTwoPA;
            const totalMade = stats.totalThreePM + stats.totalTwoPM;
            const totalRebounds = stats.totalOReb + stats.totalDReb;
            const aveFgPercent = (totalMade / totalAttempts) * 100;
            const aveThreePtPercent = (stats.totalThreePM / stats.totalThreePA) * 100;
            const aveFtPercent = (stats.totalFtm / stats.totalFta) * 100;
            const avePointsPerGame = totalPoints / stats.gamesPlayed;
            const aveAssistsPerGame = stats.totalAst / stats.gamesPlayed;
            const aveReboundsPerGame = totalRebounds / stats.gamesPlayed;
            const aveBlocksPerGame = stats.totalBlk / stats.gamesPlayed;
            const aveStlPerGame = stats.totalStl / stats.gamesPlayed;
            const totalLosses = stats.gamesPlayed - stats.totalWins;
            const winPercent = (stats.totalWins / stats.gamesPlayed) * 100;
            const winLossDifference = stats.totalWins - totalLosses;

            await userInfoRef.doc(updatedUserInfo.id).set({
                "overviewStats": {
                    "totalPoints": totalPoints,
                    "totalAttempts": totalAttempts,
                    "totalMade": totalMade,
                    "totalRebounds": totalRebounds,
                    "aveFgPercent": aveFgPercent,
                    "aveThreePtPercent": aveThreePtPercent,
                    "aveFtPercent": aveFtPercent,
                    "avePointsPerGame": avePointsPerGame,
                    "aveAssistsPerGame": aveAssistsPerGame,
                    "aveReboundsPerGame": aveReboundsPerGame,
                    "aveBlocksPerGame": aveBlocksPerGame,
                    "aveStlPerGame": aveStlPerGame,
                    "totalLosses": totalLosses,
                    "winPercent": winPercent,
                    "winLossDifference": winLossDifference,
                }
            }, { merge: true });
        }

    }
});
