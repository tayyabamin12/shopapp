import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem orders;

  const OrderItem(this.orders);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('${orders.amount}'),
        subtitle: Text(
          DateFormat('dd/MM/yyyy hh:mm').format(orders.dateTime),
        ),
        trailing: IconButton(
          icon: Icon(Icons.expand_more),
          onPressed: (){},
        ),
      ),
    );
  }
}
