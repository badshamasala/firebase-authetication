import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';

class List2 extends StatefulWidget {
  const List2({super.key});

  @override
  State<List2> createState() => _List2State();
}

class _List2State extends State<List2> {
  bool check = true;

  var checlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
        ),
        body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {},
                  child: ListTile(title: Text(products[index].name)));
            }));
  }
}
