import 'package:flutter/material.dart';
import 'package:shoppingapp/features/cart/bloc/cart_bloc.dart';
import 'package:shoppingapp/features/home/bloc/model/porduct_data_model.dart';

class CartProductTile extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;

  const CartProductTile({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
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
                  cartBloc.add(
                      RemoveFromCartEvent(productDataModel: productDataModel));
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
