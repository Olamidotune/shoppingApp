part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  //it's collecting a list here cause i need the wishlistItems.
  final List<ProductDataModel> wishlistItems;

  WishlistSuccessState({
    required this.wishlistItems,
  });
}

class RemoveFromWishlistSnackBarActionState extends WishlistActionState {}
