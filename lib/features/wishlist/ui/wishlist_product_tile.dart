import 'package:flutter/material.dart';
import 'package:shoppingapp/features/home/bloc/model/porduct_data_model.dart';

import '../bloc/wishlist_bloc.dart';

class WishlistProductTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;

  const WishlistProductTile({
    super.key,
    required this.productDataModel,
    required this.wishlistBloc,
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
                  wishlistBloc.add(
                    RemoveFromWishlistEvent(
                      productDataModel: productDataModel,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete_forever_outlined,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
