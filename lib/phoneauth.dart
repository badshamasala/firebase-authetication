import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  var otpcontroller = TextEditingController();
  var countrycode = '+91';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  prefixText: countrycode,
                  prefixStyle: TextStyle(color: Colors.black)),
              controller: otpcontroller,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: countrycode + otpcontroller.text,
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {},
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                child: Text('Send Code'))
          ],
        ),
      ),
    );
  }
}
