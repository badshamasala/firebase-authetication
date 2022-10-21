import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/list.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatefulWidget {
  const Cartpage({super.key});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<Badshaprovier>(builder: (context, value, child) {
        return ListView.builder(
            itemCount: value.newlist.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(value.newlist[index].name),
              );
            });
      }),
    );
  }
}
