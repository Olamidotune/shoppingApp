part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeProductWishListNavigateButtonClickedEvent extends HomeEvent {}

class HomeProductCartNavigateButtonClickedEvent extends HomeEvent {}
