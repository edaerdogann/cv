import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_cv/models/users.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String firstName, String lastName, String gender, String occupation)
  async {
    return await userCollection.doc(uid).set({
      'First Name': firstName,
      'Last Name': lastName,
      'Gender': gender,
      'Occupation': occupation,
    });
  }

  // Users list from snapshot
  List<User> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return User(
        firstName: doc.data()['First Name'] ?? '',
        lastName: doc.data()['Last Name'] ?? '',
        gender: doc.data()['Gender'] ?? '',
        occupation: doc.data()['Occupation'] ?? '',
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      firstName: snapshot.data()['First Name'],
      lastName: snapshot.data()['Last Name'],
      gender: snapshot.data()['Gender'],
      occupation: snapshot.data()['Occupation'],
    );
  }

  // Get users streams
  Stream<List<User>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }

  // Get user doc stream
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
}