import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MyWidget111 extends StatefulWidget {
  MyWidget111({super.key});

  @override
  State<MyWidget111> createState() => _MyWidget111State();
}

class _MyWidget111State extends State<MyWidget111> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) => Container(
              color: Colors.green,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text('$index'),
                ),
              )),
          staggeredTileBuilder: (int index) => index % 3 == 0
              ? StaggeredTile.count(1, 2)
              : StaggeredTile.count(1, 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }
}
