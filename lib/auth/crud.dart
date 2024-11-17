import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  final CollectionReference meals = FirebaseFirestore.instance.collection('meals');
  Future <void> addmeal(String meal, String description,String ingredents,String username,String steps) {
    return meals.add({
      'meal': meal,
      'time': Timestamp.now(),
      'description': description,
      'ingredents': ingredents,
      'userName': username,
      'Steps':steps
    });
  }
  Stream<QuerySnapshot> getMealStream(){
    final mealStream = meals.orderBy('time',descending: true).snapshots();
    return mealStream;


  }
  Future <void> deleteNotes(String docId){
    return meals.doc(docId).delete();
  }
}