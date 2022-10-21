import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider.dart';
import 'package:provider/provider.dart';

class Google1 extends StatefulWidget {
  const Google1({super.key});

  @override
  State<Google1> createState() => _Google1State();
}

class _Google1State extends State<Google1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                final provider =
                    Provider.of<Googleprovider>(context, listen: false);
                provider.googlelogin();
              },
              child: Text('btn'))
        ],
      ),
    );
  }
}
