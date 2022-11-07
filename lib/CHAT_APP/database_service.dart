import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  addUserData(fullname, email, password) async {
    return await userCollection.doc(uid).set({
      "full name": fullname,
      "email": email,
      "password": password,
    });
  }
}
