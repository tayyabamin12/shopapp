import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String cartId;
  final double price;
  final int quantity;
  final String title;

  CartItem(this.cartId, this.price, this.quantity, this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.purple,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(child: Text('\$ $price')),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$ ${(price * quantity)}'),
          trailing: Text('$quantity *'),
        ),
      ),
    );
  }
}
