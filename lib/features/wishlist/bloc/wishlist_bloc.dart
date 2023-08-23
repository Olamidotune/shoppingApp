import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoppingapp/data/wishlist_items.dart';
import 'package:shoppingapp/features/home/bloc/model/porduct_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<RemoveFromWishlistEvent>(removeFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

//remove from wishlist function.
  FutureOr<void> removeFromWishlistEvent(
      RemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    //here you'd have to remove an event
    wishlistItems.remove(event.productDataModel);
    emit(
      WishlistSuccessState(
        wishlistItems: wishlistItems,
      ),
    );
    //here i emitted RemoveFromWlSnackbarActionstate inside the onPressed function
    emit(RemoveFromWishlistSnackBarActionState());
  }
}
