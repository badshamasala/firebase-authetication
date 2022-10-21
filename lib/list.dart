import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cartpage.dart';
import 'package:flutter_application_1/model.dart';
import 'package:flutter_application_1/practise.dart';
import 'package:provider/provider.dart';

class List1 extends StatefulWidget {
  const List1({super.key});

  @override
  State<List1> createState() => _List1State();
}

class _List1State extends State<List1> {
  bool check = true;

  var checlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cartpage()),
                  );
                },
                icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount:
                Provider.of<Badshaprovier>(context, listen: false).count1,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(Provider.of<Badshaprovier>(context, listen: false)
                    .prod[index]
                    .name),
                /*  leading: Image(image: NetworkImage(products[index].image)), */
                trailing: Container(
                    color: Colors.transparent,
                    child: /* check
                        ? */
                        TextButton(
                            onPressed: () {
                              Provider.of<Badshaprovier>(context, listen: false)
                                  .badsha(index);
                            },
                            child: Text('Add'))
                    /*  : TextButton(
                            onPressed: () {
                              /* Provider.of<Badshaprovier>(context, listen: false)
                                  .badsha(index); */
                            },
                            child: Text('Remove')) */
                    ),
                // trailing: Checkbox(value: value, onChanged: onChanged) ,
              );
            }));
  }
}

class Badshaprovier with ChangeNotifier {
  List<Item> prod = [
    Item(
        id: '1',
        name: 'mango',
        des: 'fruit',
        price: 10,
        image:
            'https://img.freepik.com/premium-photo/ripe-mango-with-green-leaf-isolated-white_252965-183.jpg'),
    Item(
        id: '2',
        name: 'apple',
        des: 'fruit',
        price: 10,
        image: 'https://thumbs.dreamstime.com/b/fuji-apple-4282415.jpg'),
    Item(
        id: '3',
        name: 'banana',
        des: 'fruit',
        price: 10,
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlU-t2aHmlb7Ry4SGGPqdb019Sp7x3p8TnMQ&usqp=CAU'),
    Item(
        id: '1',
        name: 'watermelon',
        des: 'fruit',
        price: 10,
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeUk0yvJ4WZfnA5_aFdbW1yld4uPEiNdf0GQ&usqp=CAU'),
  ];

  int get count1 => prod.length;

  List<Item> newlist = [];

  badsha(index) {
    newlist.add(prod[index]);
    notifyListeners();
  }
}
