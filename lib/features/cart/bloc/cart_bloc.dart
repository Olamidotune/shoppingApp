import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoppingapp/data/cart_items.dart';
import 'package:shoppingapp/features/home/bloc/model/porduct_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartEvent>(removeFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    //in this event run/show CartSuccessState.
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> removeFromCartEvent(
      RemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.productDataModel);
    emit(
      CartSuccessState(cartItems: cartItems),
    );
    emit(RemoveFromCartSnackBarActionState());
  }
}
