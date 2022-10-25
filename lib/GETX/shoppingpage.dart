import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopPage extends StatelessWidget {
  final shopcontroller = Get.put(ShopController());
  final cartcontroller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetX<ShopController>(builder: (controller) {
        print(controller.products.length);
        return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.products[index].name),
                trailing: TextButton(
                    onPressed: () {
                      cartcontroller.addmethod(controller.products[index]);
                      print(cartcontroller.cartitem);
                    },
                    child: Text('Add')),
              );
            });
      }),
    );
  }
}

class CartController extends GetxController {
  var cartitem = [].obs;

  addmethod(Modal item) {
    cartitem.add(item);
  }
}

class ShopController extends GetxController {
  var products = <Modal>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  fetch() {
    var product = [
      Modal(name: 'iphone'),
      Modal(name: 'isamsung'),
      Modal(name: 'apple'),
      Modal(name: 'masala'),
    ];

    products.value = product;
  }
}

class Modal {
  String name;
  Modal({required this.name});
}
