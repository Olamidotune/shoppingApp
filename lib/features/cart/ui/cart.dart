import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/features/cart/bloc/cart_bloc.dart';
import 'package:shoppingapp/features/cart/ui/cart_product_tile.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = 'CartScreen';

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                //i got cartItems from CartSuccessState
                itemCount: successState.cartItems.length,
                itemBuilder: (context, index) {
                  return CartProductTile(
                      productDataModel: successState.cartItems[index],
                      cartBloc: cartBloc);
                },
              );
          }
          return Container();
        },
      ),
    );
  }
}
