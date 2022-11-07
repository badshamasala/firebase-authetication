import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class Api1234 extends StatefulWidget {
  const Api1234({super.key});

  @override
  State<Api1234> createState() => _Api1234State();
}

class _Api1234State extends State<Api1234> {
  var username = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: username,
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: password,
            ),
            ElevatedButton(
                onPressed: () {
                  print('rashid');
                  loginmethod(username.text, password.text);
                },
                child: Text('login'))
          ],
        ),
      ),
    );
  }

  Future loginmethod(dynamic value1, dynamic value2) async {
    final response = await http.post(
      Uri.parse('http://103.69.242.42:8080/TestAPI/Auth.svc/authenticateUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          {"api_key": "myttube123456", "user_id": value1, "password": value2}),
    );

    var jsondata = jsonDecode(response.body);
    print(response.body);

    var status = jsondata[0]['status'];
    print('-------');
    print(status);

    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Container()));
    } else {}
  }
}

// To parse this JSON data, do
//
//     final modal = modalFromJson(jsonString);

List<Modal> modalFromJson(String str) =>
    List<Modal>.from(json.decode(str).map((x) => Modal.fromJson(x)));

String modalToJson(List<Modal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Modal {
  Modal({
    required this.status,
  });

  String status;

  factory Modal.fromJson(Map<String, dynamic> json) => Modal(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
