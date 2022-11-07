import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/CHAT_APP/database_service.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  registerUser(fullname, email, password) async {
    User user = (await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user!;

    if (user != null) {
      await DatabaseService(uid: user.uid)
          .addUserData(fullname, email, password);
      return true;
    } else {}
  }
}
