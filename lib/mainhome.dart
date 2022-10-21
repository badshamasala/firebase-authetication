import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                final provider =
                    Provider.of<Googleprovider>(context, listen: false);
                provider.logout();
              },
              child: Text(
                'logout',
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
      body: Column(children: [
        Text('njsdjsnnsbnsbns'),
        CircleAvatar(
          backgroundImage: NetworkImage(user.photoURL!),
        ),
        Text(user.displayName!),
        Text(user.email!)
      ]),
    );
  }
}
