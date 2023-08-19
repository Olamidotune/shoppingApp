part of 'home_bloc.dart';

@immutable

//HomeState is when the home ui is changed
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  //when the homeScreen is HomeLoadedSuccessState it should show the product data model
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

//HomeActionState is when a buttonaction is taken on the homescreen and changes its state
class HomeNavigateToWishListActionState extends HomeActionState {}

class HomeNavigateToCartListActionState extends HomeActionState {}
