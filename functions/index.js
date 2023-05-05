const functions = require("firebase-functions");
const admin = require("firebase-admin");
const firestore = require("firebase-admin/firestore");

const user_info_data = require("./test_data/user_info.json");
const courts_data = require("./test_data/courts.json");
const teams_data = require("./test_data/teams.json");
const test_data = Object.assign({}, teams_data, courts_data, user_info_data);

admin.initializeApp();
const db = admin.firestore();
const appMetaRef = db.collection('app_meta').doc('app_meta');
const userInfoRef = db.collection('user_info');
const courtsRef = db.collection('courts');
const teamsRef = db.collection('teams');

exports.populateAll = functions.https.onRequest(async (req, res) => {
    await appMetaRef.set({ seasonId: "season0" });

    test_data.userInfoList.forEach(addUserInfo);
    async function addUserInfo(userInfo) {
        await userInfoRef.doc(userInfo.id).set(userInfo);
        await userInfoRef.doc(userInfo.id)
            .collection("season_stats")
            .doc("season0")
            .set({ player: userInfo.user, seasonId: "season0" });
    }
    test_data.courtsList.forEach(addCourt);
    async function addCourt(court) {
        await courtsRef.doc(court.id).set(court);
        await courtsRef.doc(court.id).update({
            'geo.geopoint': new firestore.GeoPoint(
                court.location.lat,
                court.location.lng,
            ),
        }, { merge: true });
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
        await userInfoRef.doc(userInfo.id)
            .collection("season_stats")
            .doc("season0")
            .set({ "player": userInfo.user });
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

exports.calcDeriveableStats = functions.firestore.document('user_info/{userId}/season_stats/{seasonId}').onUpdate(async (change, context) => {
    const preUserStats = change.before.data();
    const updatedUserStats = change.after.data();

    if (updatedUserStats && (updatedUserStats.hasOwnProperty('gamesPlayed') || updatedUserStats.hasOwnProperty('gamesPlayedNoStats'))) {
        let preTotalGamesPlayed;
        try {
            preTotalGamesPlayed = (preUserStats.gamesPlayed ?? 0) + (preUserStats.gamesPlayedNoStats ?? 0);
        } catch {
            preTotalGamesPlayed = 0;
        }

        const updatedTotalGamesPlayed = (updatedUserStats.gamesPlayed ?? 0) + (updatedUserStats.gamesPlayedNoStats ?? 0);
        if (preTotalGamesPlayed != updatedTotalGamesPlayed) {
            const stats = updatedUserStats;

            const gamesPlayed = stats.gamesPlayed ?? 0;
            const gamesPlayedNoStats = stats.gamesPlayedNoStats ?? 0;

            const totalGamesPlayed = gamesPlayed + gamesPlayedNoStats
            const totalPoints = (stats.totalThreePM * 3) + (stats.totalTwoPM * 2) + stats.totalFtm;
            const totalAttempts = stats.totalThreePA + stats.totalTwoPA;
            const totalMade = stats.totalThreePM + stats.totalTwoPM;
            const totalRebounds = stats.totalOReb + stats.totalDReb;

            const aveFgPercent = (totalMade / totalAttempts) * 100;
            const aveThreePtPercent = (stats.totalThreePM / stats.totalThreePA) * 100;
            const aveFtPercent = (stats.totalFtm / stats.totalFta) * 100;
            const avePointsPerGame = totalPoints / gamesPlayed;
            const aveAssistsPerGame = stats.totalAst / gamesPlayed;
            const aveReboundsPerGame = totalRebounds / gamesPlayed;
            const aveBlocksPerGame = stats.totalBlk / gamesPlayed;
            const aveStlPerGame = stats.totalStl / gamesPlayed;
            const avePlusMinus = stats.totalPlusMinus / totalGamesPlayed;

            const totalLosses = totalGamesPlayed - stats.totalWins;
            const winPercent = (stats.totalWins / totalGamesPlayed) * 100;
            const winLossDifference = stats.totalWins - totalLosses;
            const effRating = (totalPoints + stats.totalAst + totalRebounds + stats.totalStl + stats.totalBlk - (totalAttempts - totalMade) - (stats.totalFta - stats.totalFtm) - stats.totalTO) / gamesPlayed;

            const appMeta = await appMetaRef.get();
            const currentSeasonId = appMeta.data().seasonId;
            await userInfoRef.doc(stats.player.id)
                .collection("season_stats")
                .doc(currentSeasonId)
                .set({
                    "totalGamesPlayed": totalGamesPlayed,
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
                    "avePlusMinus": avePlusMinus,
                    "totalLosses": totalLosses,
                    "winPercent": winPercent,
                    "winLossDifference": winLossDifference,
                    "effRating": effRating,
                }, { merge: true });
        }

    }
});

exports.triggerStatsUpdate = functions.https.onRequest(async (req, res) => {

    await db.collection("user_info").get().then(function (querySnapshot) {
        querySnapshot.forEach(async function (doc) {
            await doc.ref.collection("season_stats").doc("season0").update({
                "gamesPlayed": firestore.FieldValue.increment(1),
            }, { merge: true });
        });
    });

    await setTimeout(function () { }, 1000);

    await db.collection("user_info").get().then(function (querySnapshot) {
        querySnapshot.forEach(async function (doc) {
            await doc.ref.collection("season_stats").doc("season0").update({
                "gamesPlayed": firestore.FieldValue.increment(-1),
            }, { merge: true });
        });
    });

    res.json({ result: "Triggered derived stats recalculation" });
});

exports.triggerUserInfoWrite = functions.https.onRequest(async (req, res) => {

    await db.collection("user_info").get().then(function (querySnapshot) {
        querySnapshot.forEach(async function (doc) {
            await doc.ref.update({
                "random": firestore.FieldValue.increment(1),
            }, { merge: true });
        });
    });

    res.json({ result: "Triggered random user info write" });
});
