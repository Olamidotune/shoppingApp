import 'package:flutter/material.dart';
import 'package:shoppingapp/features/cart/ui/cart.dart';
import 'package:shoppingapp/features/home/ui/home.dart';
import 'package:shoppingapp/features/wishlist/ui/wishlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
        routes: {
          Home.routeName:(context) => const Home(),
          CartScreen.routeName: (context) => const CartScreen(),
          WishlistScreen.routeName: (context) => const WishlistScreen()
        });
  }
}
