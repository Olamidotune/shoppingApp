part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
    //it's collecting a list here cause i need the cartItems.
  final List<ProductDataModel> cartItems;

  CartSuccessState({
    required this.cartItems,
  });
}

class RemoveFromCartSnackBarActionState extends CartActionState{}
