import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w900),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$ ${cart.totalAmount}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  Card(
                    child: TextButton(
                      child: Text('Order Summary'),
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrders(
                          cart.items.values.toList(),
                          cart.totalAmount,
                        );
                        cart.clear();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}