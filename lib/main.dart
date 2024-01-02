import 'package:coffe_shop/models/coffee_shop.dart';
import 'package:coffe_shop/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CoffeeShop(),
      builder: (context, child) {
        return const MaterialApp(
          home: Splash(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
