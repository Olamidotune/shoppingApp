import 'package:flutter/material.dart';
import 'package:shoppingapp/features/home/bloc/home_bloc.dart';
import 'package:shoppingapp/features/home/bloc/model/porduct_data_model.dart';

class ProductTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  final String name;
  final String id;
  final String imageName;
  // final double price;
  const ProductTile({
    super.key,
    required this.productDataModel,
    required this.name,
    required this.id,
    required this.imageName,
    required this.homeBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  productDataModel.imageName,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(productDataModel.name),
              IconButton(
                onPressed: () {
                  homeBloc.add(
                    HomeProductWishListButtonClickedEvent(
                      clickedWishlistItem: productDataModel,
                    ),
                  );
                },
                icon: const Icon(Icons.favorite_outline),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(
                    HomeProductCartButtonClickedEvent(
                      //i am getting this through the constructor and the clikcedCartItem is a variable of 
                      //productdataModel 
                      clickedCartItem: productDataModel,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
