class Item {
  final String id;
  final String name;
  final String des;
  final num price;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.des,
    required this.price,
    required this.image,
  });
}

final products = [
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
/* */
