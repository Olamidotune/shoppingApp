import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/features/cart/ui/cart.dart';
import 'package:shoppingapp/features/home/bloc/home_bloc.dart';
import 'package:shoppingapp/features/home/ui/product_tile.dart';

import 'package:shoppingapp/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      //i only want to listen when i get an action state
      listenWhen: (previous, current) => current is HomeActionState,
      //i only want to build my ui when i don't get an action state.
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        //here the navigator is called because of the action state
        if (state is HomeNavigateToCartListActionState) {
          Navigator.of(context).pushNamed(CartScreen.routeName);
        } else if (state is HomeNavigateToWishListActionState) {
          Navigator.of(context).pushNamed(WishlistScreen.routeName);
        } else if (state is HomeWishlistSnackbarActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
              content: Text(
                "Item has been added to your wishlist",
              ),
            ),
          );
        } else if (state is HomeCartSnackbarActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
              content: Text("Item has been added to your cart"),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          case HomeLoadedSuccessState:
            // HomeLoadedSuccsessState has a property of products and i accessed it through successState
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
                appBar: AppBar(
                  title: const Text(
                    'Shopping App',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(
                          HomeProductWishListNavigateButtonClickedEvent(),
                        );
                      },
                      icon: const Icon(
                        Icons.favorite_outline,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(
                          HomeProductCartNavigateButtonClickedEvent(),
                        );
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    ),
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      //i called productDataModel through successState
                      return ProductTile(
                        productDataModel: successState.products[index],
                        id: successState.products[index].id,
                        imageName: successState.products[index].imageName,
                        name: successState.products[index].name,
                        homeBloc: homeBloc,
                      );
                    }));
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('ERROR!!!'),
              ),
            );
          default:
            return const SizedBox(
              height: 33,
            );
        }
      },
    );
  }
}



// Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               'Shopping App',
//               style: TextStyle(
//                 color: Colors.black,
//               ),
//             ),
//             actions: [
//               IconButton(
//                 onPressed: () {
//                   homeBloc.add(
//                     HomeProductWishListNavigateButtonClickedEvent(),
//                   );
//                 },
//                 icon: const Icon(
//                   Icons.favorite_outline,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   homeBloc.add(
//                     HomeProductCartNavigateButtonClickedEvent(),
//                   );
//                 },
//                 icon: const Icon(
//                   Icons.shopping_cart_outlined,
//                 ),
//               ),
//             ],
//           ),
//         );