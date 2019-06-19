const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.updateLikeCount = functions.firestore
    .collection('products').onUpdate((event) => {
        return admin.firestore()
            .collection('products')
            .snapshot()
            .get()
            .then(doc => {
                console.log('Got rule: ' + doc.data().name);
                return;
            });
    });


const ContentBasedRecommender = require('content-based-recommender')
const recommender = new ContentBasedRecommender({
  minScore: 0.001,
  maxSimilarDocuments: 100,
  
});
 
// prepare documents data
const documents = [
  { id: '1000001', content: 'Male male male male shirt small Gucci a nice shirt that I bought few months ago used black' },
  { id: '1000002', content: 'Female dress medium Chanel a very well maintained dress bought last year used red' },
  { id: '1000003', content: 'Female skirt large SLP a very nice leather skirt new green' },
  { id: '1000004', content: 'Male male male male jacket large BLK brand new leather jacket new black' },
  { id: '1000005', content: 'Male shirt large Zara I’m selling my shirt that I never used since I bought it new red' },
  { id: '1000006', content: 'Female bikini small Gucci I’m selling my bikini because it’s getting small for me used red' },
];


 
// start training
recommender.train(documents);
 
//get top 10 similar items to document 1000002
const similarDocuments = recommender.getSimilarDocuments('1000001', 0, 10);
 
console.log(similarDocuments);
// Take the text parameter passed to this HTTP endpoint and insert it into the
// Realtime Database under the path /messages/:pushId/original
exports.echo = functions.https.onRequest(async (req, res) => {
    // Grab the text parameter.
    const original = req.query.text;
    // Push the new message into the Realtime Database using the Firebase Admin SDK.
    res.
    res.redirect(303, snapshot.ref.toString());

 
});

expo


// Listens for new messages added to /messages/:pushId/original and creates an
// uppercase version of the message to /messages/:pushId/uppercase
// exports.makeUppercase = functions.database.ref('/messages/{pushId}/original')
//     .onCreate((snapshot, context) => {
//       // Grab the current value of what was written to the Realtime Database.
//       const original = snapshot.val();
//       console.log('Uppercasing', context.params.pushId, original);
//       var uppercase = original.toUpperCase();
//       uppercase += "bylemtu:)";
//       // You must return a Promise when performing asynchronous tasks inside a Functions such as
//       // writing to the Firebase Realtime Database.
//       // Setting an "uppercase" sibling in the Realtime Database returns a Promise.
//       return snapshot.ref.parent.child('uppercase').set(uppercase);
// });


