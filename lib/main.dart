import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart';
import './providers/products.dart';
import './screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
      ],
    child: MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
    primarySwatch: Colors.purple,
    accentColor: Colors.deepOrange,
    fontFamily: 'Lato'
    ),
    home: ProductOverviewScreen(),
    routes: {
    ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
    },
    )
    ,
    );
  }
}