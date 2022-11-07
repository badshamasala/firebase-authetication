import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/CHAT_APP/auth_service.dart';

class ChatAPP extends StatefulWidget {
  const ChatAPP({super.key});

  @override
  State<ChatAPP> createState() => _ChatAPPState();
}

class _ChatAPPState extends State<ChatAPP> {
  final _formKey = GlobalKey<FormState>();
  bool isloading = false;
  AuthService authService = AuthService();
  String fullname = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'fullname',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(5))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter full name';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(5))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'password',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(5))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        register();
                      },
                      child: Text('Register'))
                ],
              ),
            ),
    );
  }

  register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isloading = true;
      });

      await authService.registerUser(fullname, email, password).then((value) {
        if (value = true) {}
      });
    }
  }
}
