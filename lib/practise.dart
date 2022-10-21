import 'package:flutter/material.dart';
import 'package:flutter_application_1/model.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            /*    context.read<Badshaprovier>().dekhte(); */
          }),
      body: Column(
        children: [
          Center(
              /*  child: Text(Provider.of<Badshaprovier>(context, listen: false)
                .count
                .toString()), */
              ),
          /*    Text(context.watch<Badshaprovier>().value.toString()), */
        ],
      ),
    );
  }
}
