const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

var d = new Date();

const ContentBasedRecommender = require('content-based-recommender');
const recommender = new ContentBasedRecommender({
  minScore: 0.0000000001,
  maxSimilarDocuments: 100,
  
});

// exports.readUser = functions.https.onCall((data, context) => {
//     const users = admin.firestore().collection('products');
//     console.log("Function 'readuser' invoked.");
//     users.get().
//         then(snapshot => {
//             snapshot.forEach(doc => {
//                 console.log(doc.id, '=>', doc.get('itemString'));
                
//             });
//             return null;
//         }).catch(err => {
//             console.log('Error: ', err);
//             throw new Error("Profile doesn't exist");
//         });


// });

exports.getRecommendedList = functions.firestore
    .document('products/{productId}')
    .onCreate((snap, context) => {
        let counter = 0;
        let recDoc = [];
        let dbDoc = [];
        let similarDocuments = [];
        const newValue = snap.data();
        recDoc.push({"id": counter, "content": newValue.itemString});
        counter++;
        const products = admin.firestore().collection('products');
        console.log("Function 'getRecommended' invoked.");
        products.get().
            then(snapshot => {
                snapshot.forEach(doc => {
                    recDoc.push({"id": counter, "content": doc.get("itemString")});
                    counter++;
                });
                return null;
            }).catch(err => {
                console.log('Error: ', err);
                throw new Error("Profile doesn't exist");
            }).then(() => {
                recommender.train(recDoc);
                similarDocuments = recommender.getSimilarDocuments('0', 0, recDoc.length);
                return null;
            }).catch(err => {console.log(err)})
            .then(() => {
                console.log("Im array switch");
                var c = 0;
                for(var x = 0; x < similarDocuments.length; x++){
                    for(var y = 0; y < recDoc.length ; y++){
                        if(similarDocuments[x].id === recDoc[y].id){
                            dbDoc[x] = recDoc[y];
                            dbDoc[x].id = c;
                            c++;
                            console.log(dbDoc[x]);
                        }
                    }
                }
                return null;
            }).catch(err => {
                console.log(err);
            }).then(() => {
                //console.log(dbDoc);
                console.log("=============================================================");
                dbDoc = toObject(dbDoc);
                //console.log(dbDoc);
                const recProducts = admin.firestore().collection('recProducts').doc('rec');
                recProducts.set(dbDoc);
                return null;
            }).catch(err => {
                console.log(err);
            });
        
          return null;

    });

    function toObject(arr) {
        var rv = {};
        for (var i = 0; i < arr.length; ++i)
          if (arr[i] !== undefined) rv[i] = arr[i];
        return rv;
      }




// exports.updateLikeCount = functions.firestore
//     .collection('products').onUpdate((event) => {
//         return admin.firestore()
//             .collection('products')
//             .snapshot()
//             .get()
//             .then(doc => {
//                 console.log('Got rule: ' + doc.data().name);
//                 return;
//             });
//     });



 
// prepare documents data
// const documents = [
//   { id: '1000001', content: 'Male male male male shirt small Gucci a nice shirt that I bought few months ago used black' },
//   { id: '1000002', content: 'Female dress medium Chanel a very well maintained dress bought last year used red' },
//   { id: '1000003', content: 'Female skirt large SLP a very nice leather skirt new green' },
//   { id: '1000004', content: 'Male male male male jacket large BLK brand new leather jacket new black' },
//   { id: '1000005', content: 'Male shirt large Zara I’m selling my shirt that I never used since I bought it new red' },
//   { id: '1000006', content: 'Female bikini small Gucci I’m selling my bikini because it’s getting small for me used red' },
// ];


 
// // start training
// recommender.train(documents);
 
// //get top 10 similar items to document 1000002
// const similarDocuments = recommender.getSimilarDocuments('1000001', 0, 10);
 
// console.log(similarDocuments);

