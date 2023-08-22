part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedWishlistItem;

  HomeProductWishListButtonClickedEvent({
    required this.clickedWishlistItem,
  });
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductDataModel clickedCartItem;

  HomeProductCartButtonClickedEvent({
    required this.clickedCartItem,
  });
}

class HomeProductWishListNavigateButtonClickedEvent extends HomeEvent {}

class HomeProductCartNavigateButtonClickedEvent extends HomeEvent {}
