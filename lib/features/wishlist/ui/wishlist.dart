import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:shoppingapp/features/wishlist/ui/wishlist_product_tile.dart';

class WishlistScreen extends StatefulWidget {
  static const String routeName = 'Wishlist Screen';

  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(
      WishlistInitialEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist Items'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          if (state is RemoveFromWishlistSnackBarActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 2),
                backgroundColor: Colors.red,
                content: Text("Item removed from the list",),
              ),
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishlistItems.length,
                itemBuilder: (context, index) {
                  return WishlistProductTile(
                      productDataModel: successState.wishlistItems[index],
                      wishlistBloc: wishlistBloc);
                },
              );
          }
          return Container();
        },
      ),
    );
  }
}
